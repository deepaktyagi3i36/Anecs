# encoding: utf-8
# = Entity description
#
# ClearOrdersJob is an entity which deletes orders stored at orders table.
# Job deletes orders in state before "in progress" with checkout_state before "completed" and
# which had updated later than N hours ago (2 hours by default). N is defined in runtime_settings table by
# order_expire_timeout parameter.
#

require 'csv'
require 'uri'
require 'net/http'
require 'net/https'
require 'ntlm/http'

class ImportInsalesDataJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("import_insales_data_job")
      if job
        if(attributes.nil?)
          attributes = {:admin_job_id => job.id}
        end
        if(attributes[:admin_job_id].nil?)
          attributes.merge!({:admin_job_id => job.id})
        end
      end
    end
    super(attributes)
  end

  def perform

    begin
      report_started

      setup_begin_at

      setup_runbatch

      load_runtime_settings

      import_insales_data

      create_finished

      report_finished

      setup_success

    rescue Exception => e
      report_failure(e)

      setup_failure(e)
    end

    email_finished
  end

  private

  def import_insales_data
    # To reuse images from tmp folders
    #FileUtils.remove_dir("#{::Rails.root.to_s}/tmp/images/", true)
    FileUtils.mkdir_p("#{::Rails.root.to_s}/tmp/images/")
    file_name = File.join(Rails.root, 'public/insales_data.csv')
    raise "There isn't file: #{file_name}" if !File.exist?(file_name)

    # Find or create website
    website = Website.find_by_code('hunting')
    if website.nil?
      website = Website.create!(:name => 'hunting', :code => 'hunting', :about => 'hunting',
                                :domain => "www.example.com", :aggregator => "0", :enabled => 0)
    end

    # Find or create properties
    string = Datatype.find_by_code('string')
    CSV.foreach(file_name, :col_sep => "\t", :headers => true, :quote_char => '"',
                :skip_blanks => true, :encoding => "UTF-16:UTF-8") do |row|
      # Find or create properties
      row.headers.grep(/^(Свойство|Параметр):/).each do |param|
        name  = param.split(/: /).last
        property = Property.find_by_website_id_and_code(website.id, name)
        if property.nil?
          property = Property.create!(:website_id => website.id, :name => name, :code => name, :about => name,
                                      :datatype_id => string.id)
        end
      end
      break
    end

    # Find or create product type
    product_type = ProductType.find_by_website_id_and_code(website.id, 'hunting')
    if product_type.nil?
      product_type = ProductType.create!(:website_id  => website.id, :name => 'hunting',
                                         :code => 'hunting', :about => 'hunting')

      # Create product type properties
      CSV.foreach(file_name, :col_sep => "\t", :headers => true, :quote_char => '"',
                  :skip_blanks => true, :encoding => "UTF-16:UTF-8") do |row|
        row.headers.grep(/^(Свойство|Параметр):/).each do |param|
          name  = param.split(/: /).last
          property = Property.find_by_code(name)
          product_type_property = ProductTypeProperty.find_by_product_type_id_and_property_id(
              product_type.id, property.id)
          if product_type_property.nil?
            product_type_property = ProductTypeProperty.create!(:product_type_id  => product_type.id,
                                                                :property_id => property.id)
          end
        end
        break
      end
    end

    # Iterate accross document with data
    CSV.foreach(file_name, :col_sep => "\t", :headers => true, :quote_char => '"',
                :skip_blanks => true, :encoding => "UTF-16:UTF-8") do |row|

      # Create product
      product = Product.find_by_website_id_and_name(website.id, row['Название товара'])
      if product.nil?
        product = Product.create!(
            :name            => row['Название товара'],
            :permalink       => row['Пермалинк'],
            :sketch          => row['Краткое описание'] || row['Название товара'],
            :about           => row['Полное описание'],
            :metakeywords    => row['Мета тег Keyword'],
            :metadescription => row['Мета тег Description'],
            :code            => row['Название товара'],
            :enabled         => true,
            :website         => website,
            :product_type    => product_type
        )
      end

      # Create variant for product
      create_variants(website, product, row)

      # Create photos for product
      create_photos(website, product, row)
    end

    # Remove directory and all contents
    # FileUtils.remove_dir("#{::Rails.root.to_s}/tmp/images/", true)
  end

  def create_variants(website, product, row)
    rouble = Currency.find_by_code('rouble')
    variant = Variant.find_by_product_id_and_name(product.id, row['Название товара'])
    if variant.nil?
      variant = Variant.create!(
          :product_id => product.id,
          :name     => row['Название товара'],
          :currency => rouble,
          :price    => row['Цена продажи'],
          :enabled  => true)
    end
    create_properties(website, variant, row)
  end

  def create_properties(website, variant, row)
    row.headers.grep(/^(Свойство|Параметр):/).each do |param|
      name  = param.split(/: /).last
      value = row[param]
      next if value.nil?

      # Find or create property
      property = Property.find_by_website_id_and_code(website.id, name)
      variant_property = VariantProperty.find_by_variant_id_and_property_id(variant.id, property.id)
      if variant_property.nil?
        variant_property = VariantProperty.create!(:variant_id  => variant.id,
                                                   :property_id => property.id, :value => value)
      end
    end
  end

  #
  # Here is example of ulr: http://static2.insales.ru/images/products/1/4087/5042167/1s4.jpg
  def create_photos(website, product, row)
    primary = true
    row['Изображения'].split(' ').each do |url|

      # Parse url
      url_items = url.split('/')
      if url_items.size() < 1
        # There is error in http url format
        report_invalid_url(product, url)
        create_invalid_url(product, url)
        return
      end

      # Try to reuse image from tmp dir
      if File.exists?("#{::Rails.root.to_s}/tmp/images/#{url_items[url_items.size()-1]}")
        # Create based on local file
        file = File.new("#{::Rails.root.to_s}/tmp/images/#{url_items[url_items.size()-1]}", "r+")
        file.binmode

        # Create a new photo
        photo = Photo.create!(:product_id => product.id, :picture => file, :primary => primary)
        primary = false
        file.close
      else
        begin
          url  = URI.parse(url)
          http = Net::HTTP.new(url.host, url.port)
          response = request(url)
          file = File.new("#{::Rails.root.to_s}/tmp/images/#{url_items[url_items.size()-1]}", "w+")
          file.binmode
          file.write(response.body)
          file.flush

          # Create a new photo
          photo = Photo.create!(:product_id => product.id, :picture => file, :primary => primary)
          primary = false
          file.close
        rescue URI::InvalidURIError => e
          # For example: http://static2.insales.ru/images/products/1/3563/3354091/боты.jpg
          report_notparsable_url(product, url, e)
          report_notparsable_url(product, url, e)
        rescue Exception => e
          file.close if file
          throw e
        end
      end
    end
  end

  def request(url)
    # Check that proxy file exists
    file_name = File.join(Rails.root, 'config/proxy.yml')
    raise "There isn't proxy file: #{file_name}" if !File.exist?(file_name)
    yml_file = YAML::load(File.open(file_name))


    # Define http constants
    options = {:debug => false,  :http_timeout => 60, :method => :get,
               :redirect_count => 0, :max_redirects => 10, :headers => {},
               :parameters => { :page => 1, :per_page => 100},}

    http = if yml_file[::Rails.env]["host"]
      host = yml_file[::Rails.env]["host"]
      port = yml_file[::Rails.env]["port"]
      username = yml_file[::Rails.env]["username"]
      password = yml_file[::Rails.env]["password"]
      proxy = Net::HTTP::Proxy(host, port, username, password)
      proxy.new(url.host, url.port)
    else
      Net::HTTP.new(url.host, url.port)
    end

    # Set ssl
    if url.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    # Configure session
    http.open_timeout = http.read_timeout = options[:http_timeout]
    http.set_debug_output $stderr if options[:debug]

    request = Net::HTTP::Get.new(url.request_uri)

    # Set basic auth (there isn't basic auth)
    #if yml_file[::Rails.env]["username"]
    #  request.basic_auth yml_file[::Rails.env]["username"],
    #                     yml_file[::Rails.env]["password"]
    #end

    # Set header and make request
    options[:headers].each do |key, value|
      request[key] = value
    end

    # Start a new request, not redirects expects
    if yml_file[::Rails.env]["authenticate"] == "NTLM"
      domain = yml_file[::Rails.env]["domain"]
      username = yml_file[::Rails.env]["username"]
      password = yml_file[::Rails.env]["password"]
      request.ntlm_auth(username, domain, password)
    end

    http.request(request)
  end

  def report_notparsable_url(product, url, exception)
    ::Rails.logger.info("#{@admin_job.job} job is unable to parse url for a product. " +
      "Product: #{product.name} Url: #{url.inspect} Exception: #{exception.to_s}")
  end

  def report_notparsable_url(product, url, exception)
    message = "#{@admin_job.job} job is unable to parse url for a product. " +
        "Product: #{product.name} Url: #{url.inspect} Exception: #{exception.to_s}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message})
  end

  def report_invalid_url(product, url)
    ::Rails.logger.info("#{@admin_job.job} job is unable to split url for a product. " +
      "Product: #{product.name} Url: #{url.inspect}")
  end

  def create_invalid_url(product, url)
    message = "#{@admin_job.job} job is unable to parse split for a product. " +
        "Product: #{product.name} Url: #{url.inspect}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message})
  end

end
