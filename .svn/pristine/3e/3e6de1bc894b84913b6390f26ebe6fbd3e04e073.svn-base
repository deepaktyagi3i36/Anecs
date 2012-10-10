# = Entity description
#
# ClearOrdersJob is an entity which deletes orders stored at orders table.
# Job deletes orders in state before "in progress" with checkout_state before "completed" and
# which had updated later than N hours ago (2 hours by default). N is defined in runtime_settings table by
# order_expire_timeout parameter.
#

class ExportAmazonMarketJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("export_amazon_market_job")
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

      export_markets

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
  def export_markets
    Website.find(:all).each do |website|
      setup_website(website)

      load_runtime_settings

      report_iteration

      create_iteration

      export_market
    end
  end

  def setup_website(website)
    @website_id = website.id
    @website = website
  end

  def export_market
    FileUtils.mkdir_p("#{::Rails.root.to_s}/tmp/markets/")
    file = "#{::Rails.root.to_s}/tmp/markets/amazon.xml.gz"
    Zlib::GzipWriter.open(file) do |gz|
      gz.write "todo write data here"
    end

    # Move file from tmp to public (with no error)
    src = "#{::Rails.root.to_s}/tmp/markets/amazon.xml.gz"
    dest = "#{::Rails.root.to_s}/themes/#{@website.code}/public/amazon.xml.gz"
    FileUtils.mv src, dest, :force => true
  end

  def report_iteration
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "Start amazon market export for #{@website.code}")
  end

  def create_iteration
    message = "#{@admin_job.job} job is in progress. Start amazon market export for #{@website.code}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch, :message => message})
  end


end