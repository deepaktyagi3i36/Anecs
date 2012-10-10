class Backoffice::Promotions::PromoitemsController < BackofficeController
  # ::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "products.name"

    # Load data for fitlers
    @promotions_filter =  ([Promotion.new] + Promotion.find(:all))
    @products_filter =  ([Product.new] + Product.find(:all))

    # Process filtering
    @promoitem_filter = PromoitemFilter.new(params[:promoitem_filter])
    @promoitems = Promoitem.paginate  :include => [:product, :promotion],
      :conditions => @promoitem_filter.product_conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @promoitem = Promoitem.new()
  end



  def create
    @promoitem = Promoitem.new(params[:promoitem])
    if @promoitem.save
      flash[:notice] = "Promoitem was succesfully created."
      redirect_to :action => "edit", :id => @promoitem.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @promoitem = Promoitem.find(params[:id])
  end



  def update
    @promoitem = Promoitem.find(params[:id])
    if @promoitem.update_attributes(params[:promoitem])
      flash[:notice] = "Promoitem was succesfully created."
      redirect_to :action => "edit", :id => @promoitem.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Promoitem.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.promoitem.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @promotions = Promotion.find(:all)
    @products = Product.find(:all, :conditions => ProductFilter.website_conditions(@website))
  end

end
