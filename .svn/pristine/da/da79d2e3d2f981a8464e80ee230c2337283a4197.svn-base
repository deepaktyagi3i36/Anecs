# = Entity description
#
# ClearOrdersJob is an entity which deletes orders stored at orders table.
# Job deletes orders in state before "in progress" with checkout_state before "completed" and
# which had updated later than N hours ago (2 hours by default). N is defined in runtime_settings table by
# order_expire_timeout parameter.
#

class ExportSitemapJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("export_sitemap_job")
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

      export_sitemaps

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
  def export_sitemaps
    Website.find(:all).each do |website|
      setup_website(website)

      load_runtime_settings

      report_iteration

      create_iteration

      export_sitemap

      ping_search_engines
    end
  end

  def setup_website(website)
    @website_id = website.id
    @website = website
  end

  def export_sitemap
    # Create sitemap files
    website, website_id = @website, @website_id
    SitemapGenerator::Sitemap.default_host = @website.domain
    SitemapGenerator::Sitemap.public_path = "#{::Rails.root.to_s}/themes/"
    SitemapGenerator::Sitemap.sitemaps_path = "#{@website.code}/public/"
    SitemapGenerator::Sitemap.create do |interpreter|
      StaticContent.find(:all, :conditions => ["website_id = ?", website_id]).each do |item|
        interpreter.add item.url
      end
      Product.find(:all, :conditions => ["website_id = ?", website_id]).each do |product|
        interpreter.add "products?product_id=#{product.id}", :lastmod => product.updated_at
      end
      Article.find(:all, :conditions => ["website_id = ?", website_id]).each do |article|
        interpreter.add "articles?article_id=#{article.id}", :lastmod => article.updated_at
      end
    end
  end

  def ping_search_engines
    # Parse yml file with search engines
    yml_file = YAML::load(File.open("#{::Rails.root}/config/search_engines.yml"))

    # Ping search engines
    SitemapGenerator::Sitemap.verbose = false
    SitemapGenerator::Sitemap.search_engines.clear
    SitemapGenerator::Sitemap.search_engines = yml_file[::Rails.env]
    SitemapGenerator::Sitemap.ping_search_engines("#{@website.domain}/sitemap_index.xml.gz")
  end

  def report_iteration
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "Start sitemap export for #{@website.code}")
  end

  def create_iteration
    message = "#{@admin_job.job} job is in progress. Start sitemap export for #{@website.code}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch, :message => message})
  end
end