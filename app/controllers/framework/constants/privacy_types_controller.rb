class Framework::Constants::PrivacyTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @privacy_type_filter = PrivacyTypeFilter.new(params[:privacy_type_filter])
    @privacy_types = PrivacyType.paginate :conditions => @privacy_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @privacy_type = PrivacyType.new
  end



  def create
    @privacy_type = PrivacyType.new(params[:privacy_type])
    if @privacy_type.save
      flash[:notice] = I18n.t("privacy_types.flash.notices.created")
      redirect_to :action => "edit", :id => @privacy_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @privacy_type = PrivacyType.find(params[:id])
  end



  def update
    @privacy_type = PrivacyType.find(params[:id])
    if @privacy_type.update_attributes(params[:privacy_type])
      flash[:notice] = I18n.t("privacy_types.flash.notices.updated")
      redirect_to :action => "edit", :id => @privacy_type.id
    else
      render :action => "edit"
    end
  end



  def destroy
    PrivacyType.destroy(cast_ids_to_i(params))    
    flash[:notice] = I18n.t("activeview.flashes.privacy_type.notices.deleted")
    redirect_to :action => "index"
  end
end
