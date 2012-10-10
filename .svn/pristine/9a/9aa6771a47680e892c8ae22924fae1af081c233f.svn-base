class Framework::Heartbeat::WebsitesController < FrameworkController
  #::Rails.logger.error("...")

  def index
    load_data

    # Process sorting
    @orderby = params[:orderby] || "websites.name"

    # Process filtering
    @website_filter = WebsiteFilter.new(params[:website_filter])
    @websites = Website.paginate :conditions => @website_filter.conditions,
      :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    load_data
    @website = Website.new
  end

  def create
    @website = Website.new(params[:website])
    if @website.save
      flash[:notice] = I18n.t("websites.flash.notices.created")
      redirect_to :action => "edit", :id => @website.id
    else
      load_data
      render :action => "new"
    end
  end

  def edit
    load_data
    @website = Website.find(params[:id])
  end

  def update
    @website = Website.find(params[:id])
    if @website.update_attributes(params[:website])
      flash[:notice] = I18n.t("websites.flash.notices.updated")
      redirect_to :action => "edit", :id => @website.id
    else
      load_data
      render :action => "edit"
    end
  end

  def destroy
    Website.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.website.notices.deleted")
    redirect_to :action => "index"
  end

  def primary
    ids = cast_ids_to_i(params)
    if(ids.size() == 0)
      flash[:warning] = I18n.t("activeview.flashes.website.warnings.no_id_found")
      redirect_to :action => "index" and return
    end

    if(ids.size() > 1)
      flash[:warning] = I18n.t("activeview.flashes.website.warnings.too_many_rows")
      redirect_to :action => "index" and return
    end

    # Make primary as not primary
    websites = Website.find(:all, :conditions => ["websites.primary = 1"])
    websites.each do |website|
      website.update_attributes!(:primary => 0)
    end

    # Update website
    website = Website.find_by_id(ids[0])
    website.update_attributes!(:primary => "1")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
  end
end
