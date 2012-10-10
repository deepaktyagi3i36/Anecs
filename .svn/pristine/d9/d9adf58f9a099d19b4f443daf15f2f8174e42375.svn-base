class Backoffice::Products::Properties::ProductTypesController < Backoffice2lController
  #::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @product_type_filter = ProductTypeFilter.new(params[:product_type_filter])
    @product_types = ProductType.paginate :conditions => @product_type_filter.conditions(@website),
      :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    load_data
    @product_type = ProductType.new()
    load_child_data
  end

  def create
    @product_type = ProductType.new(params[:product_type].merge(:website_id => @website.id))
    if @product_type.save
      flash[:notice] = I18n.t("product_types.flash.notices.created")
      redirect_to :action => "edit", :id => @product_type.id
    else
      load_data
      load_child_data
      render :action => "new"
    end
  end

  def edit
    load_data
    @product_type = ProductType.find(params[:id])
    load_child_data
  end

  def update
    @product_type = ProductType.find(params[:id])
    if @product_type.update_attributes(params[:product_type])
      flash[:notice] = I18n.t("product_types.flash.notices.updated")
      redirect_to :action => "edit", :id => @product_type.id
    else
      load_data
      load_child_data
      render :action => "edit"
    end
  end

  def destroy
    cast_ids_to_i(params).each do |id|
      begin
        ProductType.destroy(cast_ids_to_i(params))
      rescue ActiveRecord::StatementInvalid
        # It's OK, record wasn't deleted due to fk
        flash[:warning] = I18n.t("activeview.flashes.product_type.warnings.skipped")
      end
    end
    flash[:notice] = I18n.t("activeview.flashes.product_type.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
  end

  # Method to prepare data for new & edit
  def load_child_data
    # Process sorting
    column_name = params[:column]
    column_name = "product_types.name" if params[:column].nil?
    if params[:orderby]  == column_name + " asc"
      @orderby = column_name + " desc"
    else
      @orderby = column_name + " asc"
    end

    # Process filtering
    @product_type_property_filter = ProductTypePropertyFilter.new({:product_type_id => @product_type.id})
    @product_type_properties = ProductTypeProperty.paginate :include => [:property, :product_type],
      :conditions => @product_type_property_filter.child_conditions,
      :page => params[:page], :order => @orderby
  end
end
