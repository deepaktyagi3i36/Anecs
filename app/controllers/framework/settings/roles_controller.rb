class Framework::Settings::RolesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @role_filter = RoleFilter.new(params[:role_filter])
    @roles = Role.paginate :conditions => @role_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @role = Role.new
  end



  def create
    @role = Role.new(params[:role])
    if @role.save
      flash[:notice] = I18n.t("roles.flash.notices.created")
      redirect_to :action => "edit", :id => @role.id
    else
      render :action => "new"
    end
  end


  def edit
    @role = Role.find(params[:id])
  end



  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(params[:role])
      flash[:notice] = I18n.t("roles.flash.notices.updated")
      redirect_to :action => "edit", :id => @role.id
    else
      render :action => "edit"
    end
  end



  def destroy
    Role.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.role.notices.deleted")
    redirect_to :action => "index"
  end
end
