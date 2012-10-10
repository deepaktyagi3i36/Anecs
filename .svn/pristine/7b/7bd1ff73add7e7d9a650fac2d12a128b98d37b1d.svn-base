class Backoffice::Products::Properties::ProductTypePropertiesController < Backoffice2lController
  #::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "product_types.name"

    # Load data for fitlers
    @properties_filter =  ([Property.new] + Property.find(:all))
    @product_types_filter =  ([ProductType.new] + ProductType.find(:all))

    # Process filtering
    @product_type_property_filter = ProductTypePropertyFilter.new(params[:product_type_property_filter])
    @product_type_properties = ProductTypeProperty.paginate :include => [:property, :product_type],
      :conditions => @product_type_property_filter.conditions(@website),
      :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    load_data
    @product_type_property = ProductTypeProperty.new()
  end

  def create
    @product_type_property = ProductTypeProperty.new(params[:product_type_property].merge(:website_id => @website.id))
    if @product_type_property.save
      flash[:notice] = I18n.t("product_type_properties.flash.notices.created")
      redirect_to :action => "edit", :id => @product_type_property.id
    else
      load_data
      render :action => "new"
    end
  end

  def edit
    load_data
    @product_type_property = ProductTypeProperty.find(params[:id])
  end

  def update
    @product_type_property = ProductTypeProperty.find(params[:id])
    if @product_type_property.update_attributes(params[:product_type_property])
      flash[:notice] = I18n.t("product_type_properties.flash.notices.updated")
      redirect_to :action => "edit", :id => @product_type_property.id
    else
      load_data
      render :action => "edit"
    end
  end

  def destroy
    ProductTypeProperty.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.product_type_property.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @properties = Property.find(:all)
    @product_types = ProductType.find(:all)
  end
end
