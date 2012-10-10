class Backoffice::Products::Products::BookcasesController < Backoffice2lController
  # ::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "products.name"

    # Load data for fitlers
    @articles_filter =  ([Article.new] + Article.find(:all))
    @products_filter =  ([Product.new] + Product.find(:all))

    # Process filtering
    @bookcase_filter = BookcaseFilter.new(params[:bookcase_filter])
    @bookcases = Bookcase.paginate  :include => [:product, :article],
      :conditions => @bookcase_filter.product_conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @bookcase = Bookcase.new()
  end



  def create
    @bookcase = Bookcase.new(params[:bookcase])
    if @bookcase.save
      flash[:notice] = "Bookcase was succesfully created."
      redirect_to :action => "edit", :id => @bookcase.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @bookcase = Bookcase.find(params[:id])
  end



  def update
    @bookcase = Bookcase.find(params[:id])
    if @bookcase.update_attributes(params[:bookcase])
      flash[:notice] = "Bookcase was succesfully created."
      redirect_to :action => "edit", :id => @bookcase.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Bookcase.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.bookcase.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @articles = Article.find(:all)
    @products = Product.find(:all, :conditions => ProductFilter.website_conditions(@website))
  end

end
