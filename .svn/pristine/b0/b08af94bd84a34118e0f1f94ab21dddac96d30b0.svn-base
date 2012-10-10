class Framework::Constants::AlertTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @alert_type_filter = AlertTypeFilter.new(params[:alert_type_filter])
    @alert_types = AlertType.paginate :conditions => @alert_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @alert_type = AlertType.new
  end



  def create
    @alert_type = AlertType.new(params[:alert_type])
    if @alert_type.save
      flash[:notice] = I18n.t("alert_types.flash.notices.created")
      redirect_to :action => "edit", :id => @alert_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @alert_type = AlertType.find(params[:id])
  end



  def update
    @alert_type = AlertType.find(params[:id])
    if @alert_type.update_attributes(params[:alert_type])
      flash[:notice] = I18n.t("alert_types.flash.notices.updated")
      redirect_to :action => "edit", :id => @alert_type.id
    else
      render :action => "edit"
    end
  end



  def destroy
    AlertType.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.alert_type.notices.deleted")
    redirect_to :action => "index"
  end
end
