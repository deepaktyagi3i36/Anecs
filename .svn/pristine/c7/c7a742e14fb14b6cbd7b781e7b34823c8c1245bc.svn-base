require "base64"
# = Entity description
#
# ClearOrdersJob is an entity which deletes orders stored at orders table.
# Job deletes orders in state before "in progress" with checkout_state before "completed" and
# Job deletes orders in state before "in progress" with checkout_state before "completed" and
# which had updated later than N hours ago (2 hours by default). N is defined in runtime_settings table by
# order_expire_timeout parameter.
#

class ExportDatabaseJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("export_database_job")
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

      export_database

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
  def export_database
    FileUtils.mkdir_p("#{::Rails.root.to_s}/tmp/databases/")
    file = "#{::Rails.root.to_s}/tmp/databases/database.xml.gz"
    Zlib::GzipWriter.open(file) do |gz|
      write_document_header(gz)
      write_all_websites(gz)
      write_all_themes(gz)
      write_all_users(gz)
      write_all_articles(gz)
      write_all_manpages(gz)
      write_all_properties(gz)
      write_all_product_types(gz)
      write_all_categories(gz)
      write_all_products(gz)
      write_all_orders(gz)
      write_all_feedbacks(gz)
      write_all_callmebacks(gz)
      write_document_footer(gz)
    end

    # Move file from tmp to public (with no error)
    FileUtils.mkdir_p("#{::Rails.root.to_s}/public/system/")
    src = "#{::Rails.root.to_s}/tmp/databases/database.xml.gz"
    dest = "#{::Rails.root.to_s}/public/system/database.xml.gz"
    FileUtils.mv src, dest, :force => true
  end

  def write_document_header(gz)
    gz.write '<?xml version="1.0" encoding="UTF-8"?>'
    gz.write '<Database xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="database.xsd">'
  end

  def write_document_footer(gz)
    gz.write '</Database>'
  end

  def write_all_websites(gz)
    write_websites_header(gz)
    Website.find(:all).each do |website|
      write_single_website(gz, website)
    end
    write_websites_footer(gz)

    report_iteration("Websites is exported successfully.")
    create_iteration("Websites is exported successfully.")
  end

  def write_websites_header(gz)
    gz.write '<Websites>'
  end

  def write_websites_footer(gz)
    gz.write '</Websites>'
  end

  def write_single_website(gz, website)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.Website(:name => website.name, :code => website.code, :about => website.about,
        :domain => website.domain, :primary => website.primary, :enabled => website.enabled){
        build_website_languages(xml, website)
        build_website_currencies(xml, website)
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end

  def build_website_languages(xml, website)
    xml.WebsiteLanguages {
      website.website_languages.each do |website_language|
        xml.WebsiteLanguage(:language => website_language.language.code){
        }
      end
      report_iteration("Website language is exported successfully.")
      create_iteration("Website language is exported successfully.")
    }
  end

  def build_website_currencies(xml, website)
    xml.WebsiteCurrencies {
      website.website_currencies.each do |website_currency|
        xml.WebsiteCurrency(:language => website_currency.currency.code){
        }
      end
      report_iteration("Website currency is exported successfully.")
      create_iteration("Website currency is exported successfully.")
    }
  end

  def write_all_themes(gz)
    write_themes_header(gz)
    Theme.find(:all).each do |theme|
      write_single_theme(gz, theme)
    end
    write_themes_footer(gz)

    report_iteration("Themes is exported successfully.")
    create_iteration("Themes is exported successfully.")
  end

  def write_themes_header(gz)
    gz.write '<Themes>'
  end

  def write_themes_footer(gz)
    gz.write '</Themes>'
  end

  def write_single_theme(gz, theme)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.Theme(:website => theme.website.code, :name => theme.name, :code => theme.code,
                :about => theme.about, :primary => theme.primary, :enabled => theme.enabled){
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end

  def write_all_users(gz)
    write_users_header(gz)
    User.find(:all).each do |user|
      write_single_user(gz, user)
    end
    write_users_footer(gz)

    report_iteration("Users is exported successfully.")
    create_iteration("Users is exported successfully.")
  end

  def write_users_header(gz)
    gz.write '<Users>'
  end

  def write_users_footer(gz)
    gz.write '</Users>'
  end

  def write_single_user(gz, user)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.User(:website => (user.website ? user.website.code : ""), :user_status => user.user_status.code,
               :firstname => user.firstname, :middlename => user.middlename, :lastname => user.lastname,
               :nickname => user.nickname, :login => user.login, :email => user.email,
               :allow_email => user.allow_email, :active => (user.active ? 1 : 0)){
        build_user_roles(xml, user)
        build_user_complaints(xml, user)
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end

  def build_user_roles(xml, user)
    xml.UserRoles {
      user.user_roles.each do |user_role|
        xml.UserRole(:role => user_role.role.code){
        }
      end
      report_iteration("User roles is exported successfully.")
      create_iteration("User roles is exported successfully.")
    }
  end

  def build_user_complaints(xml, user)
    xml.Complaints {
      user.complaints.each do |complaint|
        xml.Complaint(:title => complaint.title, :body => complaint.body){
        }
      end
      report_iteration("User complaints is exported successfully.")
      create_iteration("User complaints is exported successfully.")
    }
  end

  def write_all_articles(gz)
    write_articles_header(gz)
    Article.find(:all).each do |article|
      write_single_article(gz, article)
    end
    write_articles_footer(gz)

    report_iteration("Articles is exported successfully.")
    create_iteration("Articles is exported successfully.")
  end

  def write_articles_header(gz)
    gz.write '<Articles>'
  end

  def write_articles_footer(gz)
    gz.write '</Articles>'
  end

  def write_single_article(gz, article)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.Article(:website => article.website.code, :article_type => article.article_type.code,
                  :name => article.name, :code => article.code, :annotation => article.annotation,
                  :content => article.content, :pagetitle => article.pagetitle,
                  :metakeywords => article.metakeywords, :metadescription => article.metadescription,
                  :permalink => article.permalink, :slug => article.slug, :ancestry => article.ancestry,
                  :weight => article.weight, :enabled => article.enabled){
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end

  def write_all_manpages(gz)
    write_manpages_header(gz)
    Manpage.find(:all).each do |manpage|
      write_single_manpage(gz, manpage)
    end
    write_manpages_footer(gz)

    report_iteration("Manpages is exported successfully.")
    create_iteration("Manpages is exported successfully.")
  end

  def write_manpages_header(gz)
    gz.write '<Manpages>'
  end

  def write_manpages_footer(gz)
    gz.write '</Manpages>'
  end

  def write_single_manpage(gz, manpage)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.Manpage(:website => manpage.website.code, :name => manpage.name, :code => manpage.code,
                  :annotation => manpage.annotation, :content => manpage.content,
                  :pagetitle => manpage.pagetitle, :metakeywords => manpage.metakeywords,
                  :metadescription => manpage.metadescription,
                  :permalink => manpage.permalink, :slug => manpage.slug, :ancestry => manpage.ancestry,
                  :weight => manpage.weight, :enabled => manpage.enabled){
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end


  def write_all_properties(gz)
    write_properties_header(gz)
    Property.find(:all).each do |property|
      write_single_property(gz, property)
    end
    write_properties_footer(gz)

    report_iteration("Properties is exported successfully.")
    create_iteration("Properties is exported successfully.")
  end

  def write_properties_header(gz)
    gz.write '<Properties>'
  end

  def write_properties_footer(gz)
    gz.write '</Properties>'
  end

  def write_single_property(gz, property)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.Property(:website => property.website.code, :datatype => property.datatype.code,
                   :name => property.name, :code => property.code, :about => property.about){
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end

  def write_all_product_types(gz)
    write_product_types_header(gz)
    ProductType.find(:all).each do |product_type|
      write_single_product_type(gz, product_type)
    end
    write_product_types_footer(gz)

    report_iteration("ProductTypes is exported successfully.")
    create_iteration("ProductTypes is exported successfully.")
  end

  def write_product_types_header(gz)
    gz.write '<ProductTypes>'
  end

  def write_product_types_footer(gz)
    gz.write '</ProductTypes>'
  end

  def write_single_product_type(gz, product_type)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.ProductType(:website => product_type.website.code, :name => product_type.name,
                      :code => product_type.code, :about => product_type.about){
        build_product_type_properties(xml, product_type)
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end

  def build_product_type_properties(xml, product_type)
    xml.ProductTypeProperties {
      product_type.product_type_properties.each do |product_type_property|
        xml.ProductTypeProperty(:property => product_type_property.property.code){
        }
      end
      report_iteration("Product type properties is exported successfully.")
      create_iteration("Product type properties is exported successfully.")
    }
  end


  def write_all_categories(gz)
    write_categories_header(gz)
    Category.find(:all).each do |category|
      write_single_category(gz, category)
    end
    write_categories_footer(gz)

    report_iteration("Categories is exported successfully.")
    create_iteration("Categories is exported successfully.")
  end

  def write_categories_header(gz)
    gz.write '<Categories>'
  end

  def write_categories_footer(gz)
    gz.write '</Categories>'
  end

  def write_single_category(gz, category)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.Category(:website => category.website.code, :name => category.name, :code => category.code,
                   :about => category.about, :permalink => category.permalink, :slug => category.slug,
                   :ancestry => category.ancestry, :weight => category.weight, :enabled => category.enabled){
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end

  def write_all_products(gz)
    write_products_header(gz)
    Product.find(:all, :limit => 10).each do |product|
      write_single_product(gz, product)
    end
    write_products_footer(gz)

    report_iteration("Products is exported successfully.")
    create_iteration("Products is exported successfully.")
  end

  def write_products_header(gz)
    gz.write '<Products>'
  end

  def write_products_footer(gz)
    gz.write '</Products>'
  end

  def write_single_product(gz, product)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.Product(:website => product.website.code, :product_type => product.product_type.code,
                  :name => product.name, :code => product.code, :sketch => product.sketch,
                  :about => product.about, :rating => product.rating, :permalink => product.permalink,
                  :metakeywords => product.metakeywords, :metadescription => product.metadescription,
                  :wwwaddress => product.wwwaddress, :permalink => product.permalink, :slug => product.slug,
                  :ancestry => product.ancestry, :weight => product.weight, :enabled => product.enabled){
        build_product_photos(xml, product)
        build_product_connections(xml, product)
        build_product_instructions(xml, product)
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end

  def build_product_photos(xml, product)
    xml.Photos {
      product.photos.each do |photo|
        xml.Photo(:primary => photo.primary,
                  :picture_file_name => photo.picture_file_name,
                  :picture_content_type => photo.picture_content_type,
                  :picture_file_size => photo.picture_file_size,
                  :picture_updated_at => photo.picture_updated_at)
      end
      report_iteration("Product photos is exported successfully.")
      create_iteration("Product photos is exported successfully.")
    }
  end

  def build_product_connections(xml, product)
    xml.Connections {
      product.connections.each do |connection|
        xml.Connection(:category => connection.category.code, :bubble => connection.bubble)
      end
      report_iteration("Product connections is exported successfully.")
      create_iteration("Product connections is exported successfully.")
    }
  end

  def build_product_instructions(xml, product)
    xml.Instructions {
      product.instructions.each do |instruction|
        xml.Instruction(:position => instruction.position, :title => instruction.title,
                        :body =>  instruction.body)
      end
      report_iteration("Product instructions is exported successfully.")
      create_iteration("Product instructions is exported successfully.")
    }
  end



  def write_all_orders(gz)
    write_orders_header(gz)
    Order.find(:all).each do |order|
      write_single_order(gz, order)
    end
    write_orders_footer(gz)

    report_iteration("Orders is exported successfully.")
    create_iteration("Orders is exported successfully.")
  end

  def write_orders_header(gz)
    gz.write '<Orders>'
  end

  def write_orders_footer(gz)
    gz.write '</Orders>'
  end

  def write_single_order(gz, order)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.Order(:name => order.name, :code => order.code){
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end

  def write_all_feedbacks(gz)
    write_feedbacks_header(gz)
    Feedback.find(:all).each do |feedback|
      write_single_feedback(gz, feedback)
    end
    write_feedbacks_footer(gz)

    report_iteration("Feedbacks is exported successfully.")
    create_iteration("Feedbacks is exported successfully.")
  end

  def write_feedbacks_header(gz)
    gz.write '<Feedbacks>'
  end

  def write_feedbacks_footer(gz)
    gz.write '</Feedbacks>'
  end

  def write_single_feedback(gz, feedback)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.Feedback(:title => feedback.title){
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end

  def write_all_callmebacks(gz)
    write_callbacks_header(gz)
    Callmeback.find(:all).each do |callback|
      write_single_callback(gz, callback)
    end
    write_callbacks_footer(gz)

    report_iteration("Callmebacks is exported successfully.")
    create_iteration("Callmebacks is exported successfully.")
  end

  def write_callbacks_header(gz)
    gz.write '<Callmebacks>'
  end

  def write_callbacks_footer(gz)
    gz.write '</Callmebacks>'
  end

  def write_single_callback(gz, callback)
    builder = ::Nokogiri::XML::Builder.new do |xml|
      xml.Callmeback(:title => callback.title){
      }
    end
    gz.write erase_xml_version(builder.to_xml)
  end

  def report_iteration(message)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. #{message}")
  end

  def create_iteration(message)
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch, :message => message})
  end

  def erase_xml_version(to_xml)
    to_xml['<?xml version="1.0"?>'] = ""
    return to_xml.chomp
  end

end