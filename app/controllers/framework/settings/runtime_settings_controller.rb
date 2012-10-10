class Framework::Settings::RuntimeSettingsController < FrameworkController
  #::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @runtime_setting_filter = RuntimeSettingFilter.new(params[:runtime_setting_filter])
    @runtime_settings = RuntimeSetting.paginate :conditions => @runtime_setting_filter.conditions,
      :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    @runtime_setting = RuntimeSetting.new
  end

  def create
    @runtime_setting = RuntimeSetting.new(params[:runtime_setting])
    if @runtime_setting.save
      flash[:notice] = I18n.t("activeview.flashes.runtime_setting.notices.created")
      redirect_to :action => "edit", :id => @runtime_setting.id
    else
      render :action => "new"
    end
  end

  def edit
    @runtime_setting = RuntimeSetting.find(params[:id])
  end

  def update
    @runtime_setting = RuntimeSetting.find(params[:id])
    if @runtime_setting.update_attributes(params[:runtime_setting])
      flash[:notice] = I18n.t("activeview.flashes.runtime_setting.notices.updated")
      redirect_to :action => "edit", :id => @runtime_setting.id
    else
      render :action => "edit"
    end
  end

  def destroy
    RuntimeSetting.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.runtime_setting.notices.deleted")
    redirect_to :action => "index"
  end
end
