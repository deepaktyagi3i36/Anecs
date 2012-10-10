class Backoffice::Settings::StorehousesController < BackofficeController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Load data for fitlers
    @regions_filter =  ([Region.new] + Region.find(:all, :order => "name"))

    # Process filtering
    @storehouse_filter = StorehouseFilter.new(params[:storehouse_filter])
    @storehouses = Storehouse.paginate :include => [:region], :conditions => @storehouse_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @storehouse = Storehouse.new()
  end



  def create
    @storehouse = Storehouse.new(params[:storehouse])
    if @storehouse.save
      flash[:notice] = I18n.t("storehouses.flash.notices.created")
      redirect_to :action => "edit", :id => @storehouse.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @storehouse = Storehouse.find(params[:id])
  end



  def update
    @storehouse = Storehouse.find(params[:id])
    if @storehouse.update_attributes(params[:storehouse])
      flash[:notice] = I18n.t("storehouses.flash.notices.updated")
      redirect_to :action => "edit", :id => @storehouse.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Storehouse.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.storehouse.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @regions = Region.find(:all, :order => "name")
  end
end
