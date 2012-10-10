class Framework::Settings::RegionsController < FrameworkController
  #::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @region_filter = RegionFilter.new(params[:region_filter])
    @regions = Region.paginate :conditions => @region_filter.conditions,
      :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(params[:region])
    if @region.save
      flash[:notice] = I18n.t("activeview.flashes.region.notices.created")
      redirect_to :action => "edit", :id => @region.id
    else
      render :action => "new"
    end
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    if @region.update_attributes(params[:region])
      flash[:notice] = I18n.t("activeview.flashes.region.notices.updated")
      redirect_to :action => "edit", :id => @region.id
    else
      render :action => "edit"
    end
  end

  def destroy
    Region.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.region.notices.deleted")
    redirect_to :action => "index"
  end
end
