class Backoffice::Products::Products::ProductsController < Backoffice2lController
  # ::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "products.name"

    # Load data for fitlers
    @product_types_filter =  ([ProductType.new] + ProductType.find(:all))

    # Process filtering
    @product_filter = ProductFilter.new(params[:product_filter])
    @products = Product.paginate :include => [:product_type],
                                 :conditions => @product_filter.conditions(@website),
                                 :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    load_data
    @product = Product.new()
  end

  def create
    @product = Product.new(params[:product].merge(:website_id => @website.id))
    if @product.save
      flash[:notice] = "Product was succesfully created."
      redirect_to :action => "edit", :id => @product
    else
      load_data
      render :action => "new"
    end
  end

  def edit
    load_data
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Product was succesfully updated."
      redirect_to :action => "edit", :id => @product
    else
      load_data
      render :action => "edit"
    end
  end

  def destroy
    begin
      Product.destroy(cast_ids_to_i(params))
      flash[:notice] = I18n.t("activeview.flashes.bookcase.notices.deleted")
    rescue
      flash[:error] = I18n.t("activerecord.errors.messages.couldnt.delete.parent")
    end
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @product_types = ProductType.find(:all, :conditions => ProductTypeFilter.website_conditions(@website), :order => "name")
  end
end
