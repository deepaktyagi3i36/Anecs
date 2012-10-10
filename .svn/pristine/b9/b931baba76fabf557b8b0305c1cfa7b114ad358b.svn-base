# = Entity description
#
# SyncRemsportJob rebuilds Solr index for models that use acts_as_solr plugin
#


class SyncRemsportJob < AdminJobBase
  # ::Rails.logger.error("...")

  # Define accessors
  attr_accessor :jsondoc
  attr_accessor :jsonresp

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("sync_remsport_job")
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

      process_products

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
  def process_products
    offset = 0
    yml_file = YAML::load(File.open("#{::Rails.root}/config/remsport.yml"))
    url = URI.parse(yml_file[::Rails.env]["url"] + "/catalog/productList")
    report_url_request(url)
    create_url_request(url)

    # Get rows to fetch
    rows_to_fetch = @runtime_settings["sync_remsport_rows_to_fetch"].to_i

    while true
      # Get product list from remsport
      request = Net::HTTP::Post.new(url.path)
      request.set_form_data({:offset => offset, :limit => rows_to_fetch, :key => yml_file[::Rails.env]["key"],
        :username => yml_file[::Rails.env]["username"], :password => yml_file[::Rails.env]["password"]})
      request.basic_auth url.user, url.password if url.user
      connection = Net::HTTP.new(url.host, url.port)

      # Start a new request
      report_request(url, request, request.body)
      create_request(url, request, request.body)
      response = connection.start {|http| http.request(request)}
      http_response_body = response.body

      # Report about start next interation
      report_processing(response.body)
      create_processing(response.body)

      # Check should we process or not
      raise_not200_inside_response(response)
      parse_json_products(response.body)
      break if @jsonresp.empty?

      # Syncronized products
      raise_error_inside_json(response.body)
      syncronize_products(response.body)
      offset += rows_to_fetch

      # Report about next interation
      report_iteration(response.body)
      create_iteration(response.body)
      @iteration += 1
    end
  end

  def raise_not200_inside_response(response)
    # Raise if response doens't contain: Net::HTTPOK 200 OK
    return if response.inspect.index("Net::HTTPOK 200 OK")
    raise "Response doesn't contains ok: #{response.inspect}"
  end

  # Here is example
  # {\"response\":{\"error\":{\"code\":403,\"message\":\"\\u0412\\u044b
  def parse_json_products(response)
    # Raise if response contain error
    @jsondoc = JSON.parse(response)
    raise "Unable to parse JSON: #{response.inspect}" if @jsondoc.nil?

    @jsonresp = @jsondoc["response"] if @jsondoc
    raise "Unable to get response: #{response.inspect}" if @jsonresp.nil?
  end

  # Here is example
  # {\"response\":{\"error\":{\"code\":403,\"message\":\"\\u0412\\u044b
  def raise_error_inside_json(response)
    # Raise if response contain error
    return if @jsonresp["error"].nil?
    error_code = @jsonresp["error"]["code"]
    error_message = @jsonresp["error"]["message"]
    raise "JSON contains error: code #{error_code.inspect}, message: #{error_message.inspect}, json: #{response.inspect}"
  end

  # Here is example:
  # {\"response\":{\"2729\":{\"product_name\":\" Creatine RLINE  200\\u043a\",
  # \"product_sku\":\"1036\",\"product_id\":\"2729\",\"price\":{\"product_price\":356,
  # \"product_currency\":\"RUB\"}},\"2648\":{\"product_name\":\"
  def syncronize_products(response)
    @jsonresp.each do |key, value|
      id = value["product_id"]
      name = value["product_name"]
      sku = value["product_sku"]
      in_stock = value["in_stock"]
      price = value["price"]["product_price"] if value["price"]
      currency = value["price"]["product_currency"] if value["price"]

      # Find a variatn with right rempsport_product_id
      conditions = VariantFilter.property_value_conditions("remsport_product_id", id)
      result = Variant.find(:all,  :conditions => conditions)
      if result.empty?
        # Hence there isn't such variant
        report_new_product(id, name, sku, price, currency, in_stock)
        create_new_product(id, name, sku, price, currency, in_stock)
      else
        # Hence there is such variant
        result.each do |variant|
          if variant.enabled == 1 && in_stock.to_i == 1
            if check_price_in_delta(variant, price, currency)
              # Both variants are active
              report_skipped_product_due_to_delta(id, name, sku, price, currency, in_stock)
              create_skipped_product_due_to_delta(id, name, sku, price, currency, in_stock)
            else
              # Update prices
              variant.update_attributes!(:price => price.to_f)

              # Both variants are active
              report_updated_product(id, name, sku, price, currency, in_stock)
              create_updated_product(id, name, sku, price, currency, in_stock)
            end
          elsif variant.enabled == 1 && in_stock.to_i == 0
            # Disabled current variant
            variant.update_attributes!(:enabled => 0)

            # Should disable current variant
            report_disabled_product(id, name, sku, price, currency, in_stock)
            create_disabled_product(id, name, sku, price, currency, in_stock)
          elsif variant.enabled == 0 && in_stock.to_i == 1
            # Check should we change price for enabled variant
            if check_price_in_delta(variant, price, currency)
              # Update enabled
              variant.update_attributes!(:enabled => 1)
            else
              # Update enabled and prices
              variant.update_attributes!(:enabled => 1, :price => price.to_f)
            end

            # Should enable current variant
            report_enabled_product(id, name, sku, price, currency, in_stock)
            create_enabled_product(id, name, sku, price, currency, in_stock)
          elsif variant.enabled == 0 && in_stock.to_i == 0
            # Should skip current variant
            report_skipped_product(id, name, sku, price, currency, in_stock)
            create_skipped_product(id, name, sku, price, currency, in_stock)
          else
            # There is error in logic
            report_unhandled_product(id, name, sku, price, currency, in_stock)
            create_unhandled_product(id, name, sku, price, currency, in_stock)
          end
        end
      end
    end
  end

  def check_price_in_delta(variant, price, currency)
    # TODO: assume that price always in rur

    # Check is price in delta or not
    delta = @runtime_settings["remsport_price_delta"]
    lower = variant.price <= price.to_f ? variant.price : price.to_f
    upper = variant.price > price.to_f ? variant.price : price.to_f
    return ((((upper - lower).to_f/upper.to_f)*100) <= delta.to_f)
  end

  def report_url_request(url)
    ::Rails.logger.info("#{@admin_job.job} job is creating url. " +
      "Url: #{url.inspect}")
  end

  def create_url_request(url)
    return if @runtime_settings["admin_job_log_level"] != 'debug'
    message = "#{@admin_job.job} job is creating url. Url: #{url.inspect}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message})
  end

  def report_request(url, request, body)
    ::Rails.logger.info("#{@admin_job.job} job is doing next request. " +
      "Url: #{url.inspect}, request: #{request.inspect}, body: #{body.inspect}")
  end

  def create_request(url, request, body)
    return if @runtime_settings["admin_job_log_level"] != 'debug'
    message = "#{@admin_job.job} job is doing next request. Url: #{url.inspect}, request: #{request.inspect}, body: #{body.inspect}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message})
  end

  def report_processing(products)
    ::Rails.logger.info("#{@admin_job.job} job is going process next products. " +
      "Iteration #{@iteration}, products: #{products.inspect}")
  end

  def create_processing(products)
    return if @runtime_settings["admin_job_log_level"] != 'debug'
    message = "#{@admin_job.job} job is going process next products: #{products}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message[0..4999]})
  end

  def report_iteration(products)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "Iteration #{@iteration}, products: #{products.inspect}")
  end

  def create_iteration(products)
    return if @runtime_settings["admin_job_log_level"] != 'debug'
    message = "#{@admin_job.job} job is in progress: #{products}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message[0..4999]})
  end

  def report_new_product(id, name, sku, price, currency, in_stock)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "There is new product, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}")
  end

  def create_new_product(id, name, sku, price, currency, in_stock)
    message = "There is new product, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message[0..4999]})
  end

  def report_updated_product(id, name, sku, price, currency, in_stock)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "The product is updated, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}")
  end

  def create_updated_product(id, name, sku, price, currency, in_stock)
    message = "The product is updated, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message[0..4999]})
  end

  def report_disabled_product(id, name, sku, price, currency, in_stock)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "The product is disabled, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}")
  end

  def create_disabled_product(id, name, sku, price, currency, in_stock)
    message = "The product is disabled, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message[0..4999]})
  end

  def report_enabled_product(id, name, sku, price, currency, in_stock)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "The product is enabled, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}")
  end

  def create_enabled_product(id, name, sku, price, currency, in_stock)
    message = "The product is enabled, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message[0..4999]})
  end

  def report_skipped_product(id, name, sku, price, currency, in_stock)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "The product is skipped, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}")
  end

  def create_skipped_product(id, name, sku, price, currency, in_stock)
    message = "The product is skipped, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message[0..4999]})
  end

  def report_skipped_product_due_to_delta(id, name, sku, price, currency, in_stock)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "The product is skipped due to delta, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}")
  end

  def create_skipped_product_due_to_delta(id, name, sku, price, currency, in_stock)
    message = "The product is skipped due to delta, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message[0..4999]})
  end

  def report_unhandled_product(id, name, sku, price, currency, in_stock)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "The product is unhandled, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}")
  end

  def create_unhandled_product(id, name, sku, price, currency, in_stock)
    message = "The product is unhandled, id: #{id}, name: #{name}, sku: #{sku}, price: #{price}, currency: #{currency}, in_stock: #{in_stock}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message[0..4999]})
  end
end