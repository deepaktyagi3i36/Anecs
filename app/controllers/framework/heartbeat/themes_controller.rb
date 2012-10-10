class Framework::Heartbeat::ThemesController < FrameworkController
  #::Rails.logger.error("...")

  def index
    load_data

    # Process sorting
    @orderby = params[:orderby] || "themes.name"

    # Process filtering
    @theme_filter = ThemeFilter.new(params[:theme_filter])
    @themes = Theme.paginate :conditions => @theme_filter.conditions(@website),
      :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    load_data
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(params[:theme])
    if @theme.save
      flash[:notice] = I18n.t("themes.flash.notices.created")
      redirect_to :action => "edit", :id => @theme.id
    else
      load_data
      render :action => "new"
    end
  end

  def edit
    load_data
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])
    if @theme.update_attributes(params[:theme])
      flash[:notice] = I18n.t("themes.flash.notices.updated")
      redirect_to :action => "edit", :id => @theme.id
    else
      load_data
      render :action => "edit"
    end
  end

  def destroy
    Theme.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.theme.notices.deleted")
    redirect_to :action => "index"
  end

  def primary
    ids = cast_ids_to_i(params)
    if(ids.size() == 0)
      flash[:warning] = I18n.t("activeview.flashes.theme.warnings.no_id_found")
      redirect_to :action => "index" and return
    end

    if(ids.size() > 1)
      flash[:warning] = I18n.t("activeview.flashes.theme.warnings.too_many_rows")
      redirect_to :action => "index" and return
    end

    # Make primary as not primary
    themes = Theme.find(:all, :conditions => ["themes.website_id =? and themes.primary = 1", @website.id])
    themes.each do |theme|
      theme.update_attributes!(:primary => 0)
    end

    # Update theme
    theme = Theme.find_by_id(ids[0])
    theme.update_attributes!(:primary => "1")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
  end
end
