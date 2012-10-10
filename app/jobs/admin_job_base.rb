# = Entity description
#
# Saleoff is en entity that contain information about saleoff such name and short description.
# There are a sale offs to sell a product with discount sometimes. Saleoff store at this tables.
# Product that included into saleoff are localted at saleoff_product table.
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect 100-1000 records
#
#
class AdminJobBase < Struct.new(:job_id, :website_id)
  # ::Rails.logger.error("...")


  # Define accessors
  attr_accessor :admin_job
  attr_accessor :admin_job_id
  attr_accessor :website
  attr_accessor :website_id

  # Define accessors
  attr_accessor :runbatch
  attr_accessor :iteration
  attr_accessor :runtime_settings

  def initialize(attributes = nil)
    super(attributes)

    if attributes
      # Get mandatory attributes
      @admin_job_id = attributes[:admin_job_id]
      @website_id = attributes[:website_id]
      @admin_job = AdminJob.find_by_id(@admin_job_id)
      @website = Website.find_by_id(@website_id)
    end

    # Init attributes
    @runbatch = 0
    @iteration = 0
    @runtime_settings = Hash.new
  end

  def load_runtime_settings
    @runtime_settings = Hash.new()
    all_runtime_settings = RuntimeSetting.find(:all)

    # Load common settings
    all_runtime_settings.each do |item|
      next if item.website_id
      @runtime_settings[item.code] = item.value
    end
    return if @website.nil?

    # Overload for particular website
    all_runtime_settings.each do |item|
      next if item.website_id.nil?
      next if item.website_id != @website.id
      @runtime_settings[item.code] = item.value
    end
  end

  def setup_runbatch
    maximum = AdminJobReport.maximum("runbatch", :conditions => ["admin_job_id = ? ", @admin_job_id])
    @runbatch = (maximum.nil? ? 0 : maximum) + 1
  end

  def report_started
    ::Rails.logger.info("#{@admin_job.job} job is started")
  end

  def report_finished
    ::Rails.logger.info("#{@admin_job.job} job is finished")
  end

  def report_failure(e)
    ::Rails.logger.error("#{@admin_job.job} job is finished with error: " +
      e.to_s + "\n" + e.backtrace.join("\n").to_s)
  end

  def create_finished
    # Store message to database
    message = "#{@admin_job.job} job is finished"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch, :message => message})
  end

  def setup_begin_at
    @admin_job.update_attributes!(:begin_at => Time.now)
  end

  def setup_success
    @admin_job.update_attributes!(:success => 1, :finish_at => Time.now, :exception => nil )
  end

  def setup_failure(e)
    # There is job: truncate_database_job that truncate self.
    exception = (e.to_s + "\n" + e.backtrace.join("\n").to_s)
    @admin_job.update_attributes!(:success => 0, :finish_at => Time.now, :exception => exception[0..4999] )
  end

  def email_finished
    report_by_email = @runtime_settings["email_admin_job_report"]
    return if report_by_email.nil? || report_by_email != "1"
    Postoffice.admin_job_notification(@admin_job, @runtime_settings).deliver
  end

end
