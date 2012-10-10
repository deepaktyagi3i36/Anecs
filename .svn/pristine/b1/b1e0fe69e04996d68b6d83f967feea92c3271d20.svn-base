## This controller handles the login/logout function of the site.
class SessionsController < ApplicationController
  # ::Rails.logger.error("...")

  # Setup layout
  layout 'greetings'

  # before_filter :require_no_user, :only => [:new, :create]
  # before_filter :require_user, :only => :destroy
  # before_filter :add_breadcrumbs_by_path

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    # Check user status before process
    user = User.find_by_login(@user_session.login)
    if @user_session.valid? && user
      active_status = UserStatus.find_by_code "active"
      if user.user_status_id != active_status.id
        # Here is invalid user status error, add this error to form
        @user_session.errors.add_to_base(I18n.t('activerecord.errors.models.user_session.invalid_user_status'))
        render :action => 'new' and return
      end
    end

    if @user_session.save
      flash[:notice] = I18n.t("activeview.flashes.user_session.notices.created")
      redirect_to '/myaccount/welcome/dashboard'
    else
      render :action => :new
    end
  end

  def destroy
    current_session.destroy
    flash[:notice] = I18n.t("activeview.flashes.user_session.notices.deleted")
    redirect_to root_url
  end

end