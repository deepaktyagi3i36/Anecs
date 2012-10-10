class Backoffice::Settings::RuntimeSettingsController < BackofficeController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "admin_jobs.name"

    # Process filtering
    @admin_job_filter = AdminJobFilter.new(params[:admin_job_filter])
    @admin_jobs = AdminJob.paginate :conditions => @admin_job_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @admin_job = AdminJob.new()
  end



  def create
    @admin_job = AdminJob.new(params[:admin_job])
    if @admin_job.save
      flash[:notice] = I18n.t("activeview.flashes.admin_job.notices.created")
      redirect_to :action => "edit", :id => @admin_job.id
    else
      load_data
      render :action => "new"
    end
  end

  def edit
    load_data
    @admin_job = AdminJob.find(params[:id])
  end

  def update
    @admin_job = AdminJob.find(params[:id])
    if @admin_job.update_attributes(params[:admin_job])
      flash[:notice] = I18n.t("activeview.flashes.admin_job.notices.updated")
      redirect_to :action => "edit", :id => @admin_job.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    AdminJob.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.admin_job.notices.deleted")
    redirect_to :action => "index"
  end



  def start
    # Execute a tasks
    cast_ids_to_i(params).each do |id|
      admin_job = AdminJob.find_by_id(id)
      # Delayed::Job.enqueue NewsletterJob.new('lorem ipsum...', emails)
      Delayed::Job.enqueue Kernel.const_get(admin_job.job).new(:admin_job_id => admin_job.id,
                                                               :website_id => @website_id)
    end

    # No user in case truncate while(!) database job is executed
    if User.count > 0
      # Redirect
      flash[:notice] = I18n.t("activeview.flashes.admin_job.notices.started")
      redirect_to :action => "index"
    else
      # Redirect, this is can be for truncate while(!) database job
      flash[:notice] = I18n.t("activeview.flashes.admin_job.notices.started")
      redirect_to root_path
    end
  end



  def execute
    # Execute a tasks
    cast_ids_to_i(params).each do |id|
      admin_job = AdminJob.find_by_id(id)
      Kernel.const_get(admin_job.job).new(:admin_job_id => admin_job.id,
                                          :website_id => @website_id).perform
    end

    # No user in case truncate while(!) database job is executed
    if User.count > 0
      # Redirect
      flash[:notice] = I18n.t("activeview.flashes.admin_job.notices.executed")
      redirect_to :action => "index"
    else
      # Redirect, this is can be for truncate while(!) database job
      flash[:notice] = I18n.t("activeview.flashes.admin_job.notices.executed")
      redirect_to root_path
    end
  end



  def reset
    # Execute a tasks
    cast_ids_to_i(params).each do |id|
      admin_job = AdminJob.find_by_id(id)
      AdminJobReport.delete_all(["admin_job_id = ? ", admin_job.id])
      admin_job.update_attributes(:success => 0, :begin_at => nil, :finish_at => nil, :exception => nil)
    end
    # Redirect
    flash[:notice] = I18n.t("activeview.flashes.admin_job.notices.resetted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    # @categories = Category.find(:all)
    # @infoitems = Expert.find(:all)
  end

end
