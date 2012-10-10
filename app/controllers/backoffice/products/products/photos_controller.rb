class Backoffice::Products::Products::PhotosController < BackofficeController
  #::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "products.name"

    # Load data for fitlers
    @products_filter =  ([Product.new] + Product.find(:all, :order => "name"))

    # Process filtering
    @photo_filter = PhotoFilter.new(params[:photo_filter])
    @photos = Photo.paginate :include => [:product], :conditions => @photo_filter.conditions(@website),
                             :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    load_data
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = "Photo was succesfully created."
      redirect_to :action => "edit", :id => @photo.id
    else
      load_data
      render :action => "new"
    end
  end

  def edit
    load_data
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Photo was succesfully created."
      redirect_to :action => "edit", :id => @photo.id
    else
      load_data
      render :action => "edit"
    end
  end

  def destroy
    Photo.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.bookcase.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @products = Product.find(:all, :conditions => ProductFilter.website_conditions(@website), :order => "name")
  end
end
