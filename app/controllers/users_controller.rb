class UsersController < ApplicationController
  # ::Rails.logger.error("...")
  layout "greetings"

  before_filter :require_no_user, :only => [:new, :create, :activate, :forgot, :reset]
  before_filter :require_user, :only => [:show, :edit, :update]
  # before_filter :add_breadcrumbs_by_path

  def new
    @user = User.new(:allow_email => 0)
    session[:user_captcha] = @user.reset_captcha_key
  end

  def create
    @user = User.new(params[:user])
    @user.captcha_key = session[:user_captcha]
    @user.user_status_id = UserStatus.find_by_code('pending').id
    if @user.save_without_session_maintenance
      session[:user_captcha] = nil
      @user.reset_perishable_token!
      Postoffice.signup_notification(@user, @runtime_settings).deliver
      flash[:notice] = I18n.t("activeview.flashes.user.notices.thanks_for_singing_up")
      redirect_back_or_default root_url
    else
      session[:user_captcha] = @user.reset_captcha_key
      render :action => :new
    end
  end

  def activate
    @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
    raise Exception if @user.active?

    @user.active = true
    if @user.save
      # Update active status
      active_status = UserStatus.find_by_code "active"
      if @user.update_attributes(:user_status_id => active_status.id)
        # Activate user
        UserSession.create(@user, false)
        @user.reset_perishable_token!
        Postoffice.activation(@user, @runtime_settings).deliver
        flash[:notice] = I18n.t("activeview.flashes.user.notices.singup_complete")
        redirect_to root_url
      else
        # Setup error to update
        @user.errors.add_to_base(I18n.t('activerecord.errors.models.user.inv_user_status_update'))
        render :action => :new
      end
    else
      render :action => :new
    end
  end

  def resend
    @email = Email.new(params[:email])
    if request.post?
      render :action => :resend and return if !@email.valid?
      pending_status = UserStatus.find_by_code('pending')
      user = User.find_by_email_and_user_status_id(@email.email, pending_status.id)
      if user && !user.perishable_token.nil?  && !user.perishable_token.blank?
        user.reset_perishable_token!
        Postoffice.signup_notification(user, @runtime_settings).deliver
        flash[:notice] = I18n.t("activeview.flashes.email.notices.activation_letter_resend", :email => user.email)
      else
        flash[:warning] = I18n.t("activeview.flashes.email.warnings.inv_email_for_resend", :email => @email.email)
      end
      redirect_back_or_default root_url
    end
  end

  def forgot
    @email = Email.new(params[:email])
    if request.post?
      render :action => :forgot and return if !@email.valid?
      active_status = UserStatus.find_by_code('active')
      user = User.find_by_email_and_user_status_id(@email.email, active_status.id)
      if user
        user.reset_perishable_token!
        Postoffice.reset_notification(user, @runtime_settings).deliver
        flash[:notice] = I18n.t("activeview.flashes.email.notices.reset_code_sent", :email => user.email)
      else
        flash[:warning] = I18n.t("activeview.flashes.email.warnings.inv_email", :email => @email.email)
      end
      redirect_back_or_default root_url
    end
  end

  def reset
    @password = Password.new(params[:password])
    @user = User.find_using_perishable_token(params[:reset_code], 1.week) unless params[:reset_code].nil?
    if !@user.nil?
      if request.post?
        render :action => :reset and return if !@password.valid?
        if @user.update_attributes(:password => @password.password, :password_confirmation => @password.password_confirmation, :captcha_key => "unused here", :captcha_text => "unused here")
          UserSession.create(@user, false)
          flash[:notice] = I18n.t("activeview.flashes.password.notices.password_resetted", :email => @user.email)
          redirect_back_or_default root_url
        else
          # Here is error to update
          @password.errors.add_to_base(I18n.t('activerecord.errors.models.user.inv_password_update'))
          render :action => :reset
        end
      else
        render :action => :reset
      end
    else
      # Here is invalid reset code
      flash[:warning] = I18n.t("activeview.flashes.password.warnings.inv_reset_code")
      redirect_back_or_default root_url
    end
  end

end
