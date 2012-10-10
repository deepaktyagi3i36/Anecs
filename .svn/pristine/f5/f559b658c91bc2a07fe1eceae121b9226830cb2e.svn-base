# This controller handles the login/logout function of the site.
class FeedbacksController < ApplicationController
  # ::Rails.logger.error("...")
  layout "greetings"

  # TODO: see user model for captcha
  #include CaptchaHelper
  #captchable_actions :new, :create
  #set_captchable Feedback

  # render new.rhtml
  def new
    load_data
    @feedback = Feedback.new()
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    active_status = ContactStatus.find_by_code("active")
    @feedback.contact_status_id = active_status.id if !active_status.nil?
    if @current_user.nil?
      @feedback.captcha_key = get_captcha_key(params[:captcha_id])
    else
      @feedback.user_id = @current_user.id
    end
    if @feedback.save
      flash[:notice] = I18n.t("flashes.feedback.notices.created")
      Postoffice.contact_notification(@feedback).deliver
      redirect_to :controller => "welcome"
    else
      load_data
      render :action => :new
    end
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @contact_types = ContactType.find(:all, :order => "name", :conditions => 'enabled = 1')
  end
end
