class Framework::Constants::AnnouncementStatusesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @announcement_status_filter = AnnouncementStatusFilter.new(params[:announcement_status_filter])
    @announcement_statuses = AnnouncementStatus.paginate :conditions => @announcement_status_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @announcement_status = AnnouncementStatus.new
  end



  def create
    @announcement_status = AnnouncementStatus.new(params[:announcement_status])
    if @announcement_status.save
      flash[:notice] = I18n.t("announcement_status.flash.notices.created")
      redirect_to :action => "edit", :id => @announcement_status.id
    else
      render :action => "new"
    end
  end


  def edit
    @announcement_status = AnnouncementStatus.find(params[:id])
  end



  def update
    @announcement_status = AnnouncementStatus.find(params[:id])
    if @announcement_status.update_attributes(params[:announcement_status])
      flash[:notice] = I18n.t("announcement_status.flash.notices.updated")
      redirect_to :action => "edit", :id => @announcement_status.id
    else
      render :action => "edit"
    end
  end



  def destroy
    AnnouncementStatus.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.announcement_status.notices.deleted")
    redirect_to :action => "index"
  end
end
