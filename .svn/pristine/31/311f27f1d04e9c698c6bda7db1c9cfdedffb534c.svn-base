class Backoffice::Products::Products::ConnectionsController < Backoffice2lController
  # ::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "products.name"

    # Load data for fitlers
    @categories_filter =  ([Category.new] + Category.find(:all,:order => "name"))
    @products_filter =  ([Product.new] + Product.find(:all, :order => "name"))

    # Process filtering
    @connection_filter = ConnectionFilter.new(params[:connection_filter])
    @connections = Connection.paginate :include => [:product, :category],
      :conditions => @connection_filter.conditions(@website), :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    load_data
    @connection = Connection.new()
  end

  def create
    @connection = Connection.new(params[:connection])
    if @connection.save
      flash[:notice] = "Connection was succesfully created."
      redirect_to :action => "edit", :id => @connection.id
    else
      load_data
      render :action => "new"
    end
  end

  def edit
    load_data
    @connection = Connection.find(params[:id])
  end

  def update
    @connection = Connection.find(params[:id])
    if @connection.update_attributes(params[:connection])
      flash[:notice] = "Connection was succesfully created."
      redirect_to :action => "edit", :id => @connection.id
    else
      load_data
      render :action => "edit"
    end
  end

  def destroy
    Connection.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.connection.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @categories = Category.find(:all, :conditions => CategoryFilter.website_conditions(@website), :order => "name")
    @products = Product.find(:all, :conditions => ProductFilter.website_conditions(@website), :order => "name")
  end
end
