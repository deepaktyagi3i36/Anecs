# This controller handles the login/logout function of the site.
class CallmebacksController < ApplicationController
  # ::Rails.logger.error("...")
  layout "greetings"

  # TODO: see user model for captcha
  # include CaptchaHelper
  #captchable_actions :new, :create
  #set_captchable Callmeback

  # render new.rhtml
  def new
    load_data
    #init_captcha
    @callmeback = Callmeback.new()
  end

  def create
    @callmeback = Callmeback.new(params[:callmeback])
    active_status = ContactStatus.find_by_code("active")
    @callmeback.contact_status_id = active_status.id if !active_status.nil?
    if @current_user.nil?
      @callmeback.captcha_key = get_captcha_key(params[:captcha_id])
    else
      @callmeback.user_id = @current_user.id
    end
    if @callmeback.save
      session["captcha_text_#{params[:captcha_key]}"] = nil
      flash[:notice] = I18n.t("flashes.callmeback.notices.created")
      Postoffice.contact_notification(@callmeback, @runtime_settings).deliver
      redirect_to :controller => "welcome"
    else
      load_data
      #init_captcha
      render :action => "new"
    end
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @contact_types = ContactType.find(:all, :order => "name", :conditions => 'enabled = 1')
  end
end
