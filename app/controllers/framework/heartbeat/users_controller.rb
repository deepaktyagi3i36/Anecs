class Framework::Heartbeat::UsersController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "users.login"

    # Load data for fitlers
    @user_statuses_filter =  ([UserStatus.new] + UserStatus.find(:all, :order => "name"))

    # Process filtering
    @user_filter = UserFilter.new(params[:user_filter])
    @users = User.paginate  :include => [:user_status], :conditions => @user_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @user = User.new
  end



  def create
    @user = User.new(params[:user])
    @user.captcha_key = "unused here"
    @user.captcha_text = "unused here"
    if @user.save
      flash[:notice] = I18n.t("users.flash.notices.created")
      redirect_to :action => "edit", :id => @user.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @user = User.find(params[:id])
  end



  def update
    @user = User.find(params[:id])
    @user.captcha_key = "unused here"
    @user.captcha_text = "unused here"
    if @user.update_attributes(params[:user])
      flash[:notice] = I18n.t("users.flash.notices.updated")
      redirect_to :action => "edit", :id => @user.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    User.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.user.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @user_statuses = UserStatus.find(:all, :order => "name")
  end
end
