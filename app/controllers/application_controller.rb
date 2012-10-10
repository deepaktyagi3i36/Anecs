# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # ::Rails.logger.error("...")
  protect_from_forgery

  helper :all
  helper_method :current_user, :current_session
  # filter_parameter_logging :password, :password_confirmation

  theme :current_theme

  before_filter :check_session
  before_filter :set_locale
  before_filter :load_runtime_settings
  before_filter :load_website
  before_filter :load_theme
  before_filter :load_languages
  before_filter :load_currencies
  before_filter :load_regions
  before_filter :load_shopping_cart
  before_filter :load_comparator
  before_filter :load_favorites
  before_filter :localize_file_load
  before_filter :liquid_partial_template
  

  protected
  #
  # Require website
  #
  def require_website
    return if @website
    flash[:warning] = I18n.t('activeview.flashes.user_session.warnings.invalid_website')
    redirect_to root_url
  end

  #
  # User subsystem related
  #
  def current_session
    return @current_session if defined?(@current_session)
    @current_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_session && current_session.user
  end

  def require_user
    unless current_user
      store_location
      flash[:warning] = I18n.t('activeview.flashes.user_session.warnings.must_be_logged_in')
      redirect_to new_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:warning] = I18n.t('activeview.flashes.user_session.warnings.must_be_logged_out')
      redirect_to root_url
      return false
    end
  end

  #
  # http://stackoverflow.com/questions/6805547/authlogic-rails-3-1
  def store_location
    #session[:return_to] = request.request_uri
    session[:return_to] = request.url
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || request.referer || default)
    session[:return_to] = nil
  end

  #
  # Theme subsystem related
  #
  def current_theme
    theme = nil
    # Load website to find primary theme for website
    website = Website.find_by_code(request.headers["WEBSITE_CODE"])
    if website.nil?
      # Get current website as primary
      websites = Website.find(:all, :conditions => ["websites.primary = 1"], :limit => 1 )
      website = websites[0] if websites.size() > 0
      if website
        # Specific: no one before_filter is executed
        theme = request.headers["THEME_CODE"]
        if theme.nil?
          themes = Theme.find(:all, :conditions => ["themes.website_id = ? and themes.primary = 1", website.id], :limit => 1)
          theme = themes[0].code if themes.size() > 0
        end
      end
    end
    ::Rails.logger.error("Current theme:" + theme.inspect)
    theme
  end

  #
  # Filters related
  #
  def get_session_id
    session = Session.find_by_session_id(request.session_options[:id])
    return (session.nil? ? nil : session.id)
  end

  # This method should update session content according to logged-in user's data
  def update_session_content
    return
    # Check shopping carts
    guest_cart = ShoppingCart.find_by_id(session[:shopping_cart_id])
    user_cart = current_user.shopping_cart
    if guest_cart.total_items != 0 || user_cart.nil?
      user_cart.destroy if !user_cart.nil?
      guest_cart.update_attribute :user_id, current_user.id
    end
    session[:shopping_cart_id] = nil
  end

  private
  #This method is used to control sessions expiry time on server and keep it consistent with client
  def check_session
    # TODO: here is problem on production
    return

    timeout_value = @runtime_settings['session_expire_timeout'].to_i
    timeout = timeout_value > 0 ? timeout_value.days : 1.minute
    if (!session[:expiry_time].nil? and session[:expiry_time] < Time.now) or session.to_hash.blank?
      if !session[:expiry_time].nil? and session[:expiry_time] < Time.now
        reset_session
      end
      # Force session storing to the database to have session.id available as a foreign key
      form_authenticity_token
      session[:expiry_time] = timeout.from_now
      s = Session.new
      s.session_id = request.session_options[:id]
      s.data = ActiveSupport::Base64.encode64(Marshal.dump(session.to_hash))
      s.save!
      params[request_forgery_protection_token] = form_authenticity_token
    end
    # Assign a new expiry time, whether the session has expired or not.
    # This should also keep it consistent with updated_at attribute which should be updated
    session[:expiry_time] = timeout.from_now
    request.session_options[:expire_after] = timeout
  end

  def set_locale
    locale = params[:locale] || session[:locale] || I18n.default_locale
    I18n.locale = locale
  end

  def load_runtime_settings
    @runtime_settings = Hash.new()
    RuntimeSetting.all.each do |item|
      @runtime_settings[item.code] = item.value
    end
  end

  def load_website
    @website = Website.find_by_code(request.headers["WEBSITE_CODE"])
    if @website.nil?
      # Get current website as primary
      websites = Website.find(:all, :conditions => ["websites.primary = 1"], :limit => 1 )
      @website = websites[0] if websites.size() > 0
    end
    ::Rails.logger.error("Current website:" + @website.inspect)
  end

  def load_theme
    if @website
      @theme = request.headers["THEME_CODE"]
      if @theme.nil?
        # Get current website as primary
        themes = Theme.find(:all, :conditions => ["themes.website_id = ? and themes.primary = 1", @website.id], :limit => 1)
        @theme = themes[0] if themes.size() > 0
      end
    end
    ::Rails.logger.error("Current theme:" + @theme.inspect)
  end

  def load_languages
    @languages = Language.find(:all, :conditions => ["enabled = 1"], :order => "name")
    if !session[:language_id].nil?
      @language = Language.find_by_id(session[:language_id])
    else
      @language = Language.find_by_code("russian")
    end
  end

  def load_currencies
    @currencies = Currency.find(:all, :conditions => ["enabled = 1"], :order => "sign")
    if !session[:currency_id].nil?
      @currency = Currency.find_by_id(session[:currency_id])
    else
      @currency = Currency.find_by_code("rouble")
    end
  end

  def load_regions
    # There is special case: none region
    @regions = Region.find(:all, :conditions => ["enabled = 1"], :order => "name")
    #@regions =  ([Region.new(:name => I18n.t("settings.other_regions"))] + @regions)
    if !session[:region_id].nil?
      @region = Region.find_by_id(session[:region_id])
      @region = Region.new(:name => I18n.t("settings.other_regions")) if @region.nil?
    else
      @region = Region.find_by_code("peterburg")
    end
  end

  def load_shopping_cart
    # TODO: here is problem on production
    return

    return if @website.nil?
    if current_user
      if @current_user.shopping_cart.nil?
        @cart = ShoppingCart.create! :user_id => @current_user.id, :website_id => @website.id
      else
        @cart = @current_user.shopping_cart
      end
    else
      if session[:shopping_cart_id].nil?
        # TODO: here is problem get by http header or params
        website = Website.find_by_name("wellness")
        old_cart = ShoppingCart.find_by_session_id(get_session_id)
        old_cart.destroy unless old_cart.nil?
        @cart = ShoppingCart.create! :session_id => get_session_id, :website_id => website.id
        session[:shopping_cart_id] = @cart.id
      else
        # TODO: here can be RecordNotFound exception
        @cart = ShoppingCart.find(session[:shopping_cart_id])
      end
    end
  end

  def load_comparator
    # TODO: here is problem on production
    return

    return if @website.nil?
    if current_user
      if @current_user.comparator.nil?
        @comparator = Comparator.create! :user_id => @current_user.id, :website_id => @webiste.id
      else
        @comparator = @current_user.comparator
      end
    else
      if session[:comparator_id].nil?
        # TODO: here is problem get by http header or params
        website = Website.find_by_name("wellness")
        old_comparator = Comparator.find_by_session_id(get_session_id)
        old_comparator.destroy unless old_comparator.nil?
        @comparator = Comparator.create! :session_id => get_session_id, :website_id => website.id
        session[:comparator_id] = @comparator.id
      else
        # TODO: here can be RecordNotFound exception
        @comparator = Comparator.find(session[:comparator_id])
      end
    end
  end

  def load_favorites
    # TODO: here is problem on production
    return

    return if @website.nil?
    if current_user
      if @current_user.favorite.nil?
        @favorites = Favorite.create! :user_id => @current_user.id
      else
        @favorites = @current_user.favorite
      end
    else
      @favorites = nil
    end
  end

  #
  # Localization variable load related
  #
  def localize_file_load
    # Load all yml files
    return if @theme.nil?
    Dir.glob("#{Rails.root}/app/assets/themes/#{@theme}/locale/*.yml").each do |file|
      I18n.load_path.push file
    end

    I18n.backend.load_translations
    I18n.reload!
  end

  #
  # function use to load the local file system, it's use to render the file by include tag in liquid
  #
  def liquid_partial_template
    # Load templates
    return if @theme.nil?
    templates_file = "#{Rails.root}/app/views/themes/#{@theme}/shared/"
    Liquid::Template.file_system = Liquid::LocalFileSystem.new(templates_file)
  end

  protected
  # Exception tests
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  #rescue_from Exception, :with => :render_all_errors
  rescue_from Exception, :with => :render_all_errors if ::Rails.env != 'development'

  def access_denied
    # Redirect to main page
    flash[:warning] = I18n.t('labels.invalid_rights')
    redirect_to root_path
    false
  end

  def render_all_errors(e)
    notify = true
    if request && request.env && request.env["PATH_INFO"]
      # Create a full path
      path = request.env["PATH_INFO"].to_s
      if request.env["QUERY_STRING"] && !request.env["QUERY_STRING"].blank?
        path += "?#{request.env["QUERY_STRING"]}"
      end

      Redirect.find(:all, :order => "priority").each do |item|
        if Regexp.new(item.pattern).match(path.to_s)
          flash[:information] = item.flash if item.flash
          redirect_to item.httpurl, :status => item.status
          return
        end
      end
      # Check should we notify about error
      InvalidRoute.find(:all, :order => "priority").each do |item|
        if Regexp.new(item.pattern).match(path.to_s)
          notify = false
          break
        end
      end
    end

    # Deliver exception notification and show right page
    ExceptionNotifier::Notifier.exception_notification(request.env, e).deliver if notify
    if (e.is_a?(ActionController::RoutingError) ||
          e.is_a?(ActionController::UnknownAction) ||
          e.is_a?(ActionController::UnknownController) ||
          e.is_a?(ActiveRecord::RecordNotFound) )
      render :template => "html_errors/page404", :status => 404,
             :layout => 'greetings', :formats => [:html]
    else
      render :template => "html_errors/page500", :status => 500,
             :layout => 'greetings', :formats => [:html]
    end
  end

end
