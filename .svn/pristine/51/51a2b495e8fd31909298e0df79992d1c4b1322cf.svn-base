class Backoffice::Products::Storehouses::InventoriesController < Backoffice2lController
  # ::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "storehouses.name"

    # Load data for fitlers
    @storehouses_filter =  ([Storehouse.new] + Storehouse.find(:all, :order => "name"))
    @products_filter =  ([Product.new] + Product.find(:all, :order => "name"))
    @variants_filter =  ([Variant.new] + Variant.find(:all, :order => "name"))

    # Process filtering
    @inventory_filter = InventoryFilter.new(params[:inventory_filter])
    @inventories = Inventory.paginate :include => [:storehouse, {:variant => [:product]}],
      :conditions => @inventory_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @inventory = Inventory.new()
  end



  def create
    @inventory = Inventory.new(params[:inventory])
    if @inventory.save
      flash[:notice] = I18n.t("inventories.flash.notices.created")
      redirect_to :action => "edit", :id => @inventory.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    @product = Product.new(params[:product])
    load_data
    @inventory = Inventory.find(params[:id])
  end



  def update
    @inventory = Inventory.find(params[:id])
    if @inventory.update_attributes(params[:inventory])
      flash[:notice] = I18n.t("inventories.flash.notices.updated")
      redirect_to :action => "edit", :id => @inventory.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Inventory.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.inventory.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @storehouses = Storehouse.find(:all)
    @variants = Variant.find(:all)
  end
end
