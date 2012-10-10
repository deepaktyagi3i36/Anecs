class Framework::Heartbeat::DelayedJobsController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "delayed_jobs.priority"

    # Process filtering
    @delayed_job_filter = DelayedJobFilter.new(params[:delayed_job_filter])
    @delayed_jobs = DelayedJob.paginate :conditions => @delayed_job_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @delayed_job = DelayedJob.new()
  end



  def create
    @delayed_job = DelayedJob.new(params[:delayed_job])
    if @delayed_job.save
      flash[:notice] = I18n.t("activeview.flashes.delayed_job.notices.created")
      redirect_to :action => "edit", :id => @delayed_job.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @delayed_job = DelayedJob.find(params[:id])
  end



  def update
    @delayed_job = DelayedJob.find(params[:id])
    if @delayed_job.update_attributes(params[:delayed_job])
      flash[:notice] = I18n.t("activeview.flashes.delayed_job.notices.updated")
      redirect_to :action => "edit", :id => @delayed_job.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    DelayedJob.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.delayed_job.notices.deleted")
    redirect_to :action => "index"
  end



  def start
    # Execute a tasks
    cast_ids_to_i(params).each do |id|
      delayed_job = DelayedJob.find_by_id(id)
      Delayed::Job.enqueue Kernel.const_get(delayed_job.job).new(delayed_job.id)
      #Delayed::Job.enqueue NewsletterJob.new('lorem ipsum...', emails)
    end
    # Redirect
    flash[:notice] = I18n.t("activeview.flashes.delayed_job.notices.started")
    redirect_to :action => "index"
  end



  def execute
    # Execute a tasks
    cast_ids_to_i(params).each do |id|
      delayed_job = DelayedJob.find_by_id(id)
      Kernel.const_get(delayed_job.job).new(delayed_job.id).perform
    end
    # Redirect
    flash[:notice] = I18n.t("activeview.flashes.delayed_job.notices.executed")
    redirect_to :action => "index"
  end



  def reset
    # Execute a tasks
    cast_ids_to_i(params).each do |id|
      delayed_job = DelayedJob.find_by_id(id)
      DelayedJobReport.delete_all(["delayed_job_id = ? ", delayed_job.id])
      delayed_job.update_attributes(:success => 0, :begin_at => nil, :finish_at => nil, :exception => nil)
    end
    # Redirect
    flash[:notice] = I18n.t("activeview.flashes.delayed_job.notices.resetted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    # @categories = Category.find(:all)
    # @infoitems = Expert.find(:all)
  end

end
