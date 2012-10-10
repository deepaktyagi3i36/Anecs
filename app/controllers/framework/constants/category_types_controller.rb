class Framework::Constants::CategoryTypesController < FrameworkController
  #::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @category_type_filter = CategoryTypeFilter.new(params[:category_type_filter])
    @category_types = CategoryType.paginate :conditions => @category_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    @category_type = CategoryType.new
  end

  def create
    @category_type = CategoryType.new(params[:category_type])
    if @category_type.save
      flash[:notice] = I18n.t("activeview.flashes.category_type.notices.created")
      redirect_to :action => "edit", :id => @category_type.id
    else
      render :action => "new"
    end
  end

  def edit
    @category_type = CategoryType.find(params[:id])
  end

  def update
    @category_type = CategoryType.find(params[:id])
    if @category_type.update_attributes(params[:category_type])
      flash[:notice] = I18n.t("activeview.flashes.category_type.notices.updated")
      redirect_to :action => "edit", :id => @category_type.id
    else
      render :action => "edit"
    end
  end

  def destroy
    CategoryType.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.category_type.notices.deleted")
    redirect_to :action => "index"
  end
end
