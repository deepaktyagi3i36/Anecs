class Framework::Constants::TimetableStatusesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @timetable_status_filter = TimetableStatusFilter.new(params[:timetable_status_filter])
    @timetable_statuses = TimetableStatus.paginate :conditions => @timetable_status_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @timetable_status = TimetableStatus.new
  end



  def create
    @timetable_status = TimetableStatus.new(params[:timetable_status])
    if @timetable_status.save
      flash[:notice] = I18n.t("timetable_statuses.flash.notices.created")
      redirect_to :action => "edit", :id => @timetable_status.id
    else
      render :action => "new"
    end
  end


  def edit
    @timetable_status = TimetableStatus.find(params[:id])
  end



  def update
    @timetable_status = TimetableStatus.find(params[:id])
    if @timetable_status.update_attributes(params[:timetable_status])
      flash[:notice] = I18n.t("timetable_statuses.flash.notices.updated")
      redirect_to :action => "edit", :id => @timetable_status.id
    else
      render :action => "edit"
    end
  end



  def destroy
    TimetableStatus.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.timetable_status.notices.deleted")
    redirect_to :action => "index"
  end
end
