class Backoffice::Products::Products::CategoriesController < Backoffice2lController
  # ::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "categories.name"

    # Process filtering
    @category_filter = CategoryFilter.new(params[:category_filter])
    @categories = Category.paginate :include => [:parent], :conditions => @category_filter.conditions(@website),
                                    :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    load_data
    @category = Category.new()
  end

  def create
    @category = Category.new(params[:category].merge(:website_id => @website.id))
    @category.website_id = @website.id if @website
    if @category.save
      flash[:notice] = "Category was succesfully created."
      redirect_to :action => "edit", :id => @category.id
    else
      load_data
      render :action => "new"
    end
  end

  def edit
    load_data
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category was succesfully created."
      redirect_to :action => "edit", :id => @category.id
    else
      load_data
      render :action => "edit"
    end
  end

  def destroy
    Category.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.bookcase.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @parents = ([Category.new] + Category.find(:all, :conditions => CategoryFilter.website_conditions(@website), :order => "name"))
  end
end
