# = Entity description
#
# Locale.
#
# == Imporvements
# See http://guides.rubyonrails.org/i18n.html. You may be tempted to store the
# chosen locale in a session or a cookie. Do not do so. The locale should be
# transparent and a part of the URL. This way you don’t break people’s basic
# assumptions about the web itself: if you send a URL of some page to a friend,
# she should see the same page, same content. But web application is not web site.
#
# Usefull:
# http://blog.hendrikvolkmer.de/2007/3/8/http-referer-and-redirect_to-back/
#
#
class LanguagesController < ApplicationController
  #::Rails.logger.error("...")

  skip_before_filter :set_locale
  skip_before_filter :check_session
  skip_before_filter :reload_user
  skip_before_filter :load_user_roles
  skip_before_filter :login_from_cookie
  skip_before_filter :load_website
  skip_before_filter :load_languages
  skip_before_filter :load_currencies
  skip_before_filter :load_regions
  skip_before_filter :load_shopping_cart
  skip_before_filter :load_comparator
  skip_before_filter :load_favorites
  skip_before_filter :load_important_categories
  skip_before_filter :load_important_products



  def edit
    #
  end

  def update
    language = Language.find_by_id(params[:id])
    if language
      I18n.locale = language.locale
      session[:locale] = language.locale
      session[:language_id] = language.id
      redirect_back_or_default(root_path)
    else
      # This is error
      flash[:warning] = I18n.t("activeview.flashes.language.warnings.inv_update")
      redirect_back_or_default(root_path)
    end
  end
end

