class Framework::Constants::UserStatusesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @user_status_filter = UserStatusFilter.new(params[:user_status_filter])
    @user_statuses = UserStatus.paginate :conditions => @user_status_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @user_status = UserStatus.new
  end



  def create
    @user_status = UserStatus.new(params[:user_status])
    if @user_status.save
      flash[:notice] = I18n.t("user_statuses.flash.notices.created")
      redirect_to :action => "edit", :id => @user_status.id
    else
      render :action => "new"
    end
  end


  def edit
    @user_status = UserStatus.find(params[:id])
  end



  def update
    @user_status = UserStatus.find(params[:id])
    if @user_status.update_attributes(params[:user_status])
      flash[:notice] = I18n.t("user_statuses.flash.notices.updated")
      redirect_to :action => "edit", :id => @user_status.id
    else
      render :action => "edit"
    end
  end



  def destroy
    UserStatus.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.user_status.notices.deleted")
    redirect_to :action => "index"
  end
end
