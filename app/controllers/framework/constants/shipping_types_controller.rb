class Framework::Constants::ShippingTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @shipping_type_filter = ShippingTypeFilter.new(params[:shipping_type_filter])
    @shipping_types = ShippingType.paginate :conditions => @shipping_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @shipping_type = ShippingType.new
  end



  def create
    @shipping_type = ShippingType.new(params[:shipping_type])
    if @shipping_type.save
      flash[:notice] = I18n.t("activeview.flashes.shipping_type.notices.created")
      redirect_to :action => "edit", :id => @shipping_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @shipping_type = ShippingType.find(params[:id])
  end



  def update
    @shipping_type = ShippingType.find(params[:id])
    if @shipping_type.update_attributes(params[:shipping_type])
      flash[:notice] = I18n.t("activeview.flashes.shipping_type.notices.updated")
      redirect_to :action => "edit", :id => @shipping_type.id
    else
      render :action => "edit"
    end
  end

  def enable
    @shipping_type = ShippingType.find(params[:id])
    if @shipping_type.update_attribute(:enabled, 1)
      flash[:notice] = I18n.t("activeview.flashes.shipping_type.notices.updated")
      redirect_to :action => :index
    else
      render :action => :index
    end
  end

  def disable
    @shipping_type = ShippingType.find(params[:id])
    if @shipping_type.update_attribute(:enabled, 0)
      flash[:notice] = I18n.t("activeview.flashes.shipping_type.notices.updated")
      redirect_to :back, :id => @shipping_type.id
    else
      render :action => :index
    end
  end



  def destroy
    ShippingType.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.shipping_type.notices.deleted")
    redirect_to :action => "index"
  end
end
