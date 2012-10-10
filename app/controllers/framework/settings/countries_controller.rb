class Framework::Settings::CountriesController < FrameworkController
  #::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @country_filter = CountryFilter.new(params[:country_filter])
    @countries = Country.paginate :conditions => @country_filter.conditions,
      :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(params[:country])
    if @country.save
      flash[:notice] = I18n.t("activeview.flashes.country.notices.created")
      redirect_to :action => "edit", :id => @country.id
    else
      render :action => "new"
    end
  end


  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    if @country.update_attributes(params[:country])
      flash[:notice] = I18n.t("activeview.flashes.country.notices.updated")
      redirect_to :action => "edit", :id => @country.id
    else
      render :action => "edit"
    end
  end

  def destroy
    Country.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.country.notices.deleted")
    redirect_to :action => "index"
  end
end
