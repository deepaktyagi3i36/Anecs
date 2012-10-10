class Framework::Constants::RequestStatusesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @request_status_filter = RequestStatusFilter.new(params[:request_status_filter])
    @request_statuses = RequestStatus.paginate :conditions => @request_status_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @request_status = RequestStatus.new
  end



  def create
    @request_status = RequestStatus.new(params[:request_status])
    if @request_status.save
      flash[:notice] = I18n.t("request_status.flash.notices.created")
      redirect_to :action => "edit", :id => @request_status.id
    else
      render :action => "new"
    end
  end


  def edit
    @request_status = RequestStatus.find(params[:id])
  end



  def update
    @request_status = RequestStatus.find(params[:id])
    if @request_status.update_attributes(params[:request_status])
      flash[:notice] = I18n.t("request_statuses.flash.notices.updated")
      redirect_to :action => "edit", :id => @request_status.id
    else
      render :action => "edit"
    end
  end



  def destroy
    RequestStatus.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.request_status.notices.deleted")
    redirect_to :action => "index"
  end
end
