class Framework::Heartbeat::UserRolesController < FrameworkController
  # ::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "users.login"

    # Load data for fitlers
    @roles_filter =  ([Role.new] + Role.find(:all,:order => "name"))
    @users_filter =  ([User.new] + User.find(:all, :order => "login"))

    # Process filtering
    @user_role_filter = UserRoleFilter.new(params[:user_role_filter])
    @user_roles = UserRole.paginate :include => [:role, :user],
      :conditions => @user_role_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @user_role = UserRole.new()
  end



  def create
    @user_role = UserRole.new(params[:user_role])
    if @user_role.save
      flash[:notice] = "UserRole was succesfully created."
      redirect_to :action => "edit", :id => @user_role.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @user_role = UserRole.find(params[:id])
  end



  def update
    @user_role = UserRole.find(params[:id])
    if @user_role.update_attributes(params[:user_role])
      flash[:notice] = "UserRole was succesfully created."
      redirect_to :action => "edit", :id => @user_role.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    UserRole.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.user_role.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @roles = Role.find(:all, :order => "name")
    @users = User.find(:all, :order => "login")
  end
end
