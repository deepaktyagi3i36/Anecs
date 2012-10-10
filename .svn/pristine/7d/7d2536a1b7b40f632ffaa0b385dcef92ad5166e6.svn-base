require 'spec_helper'

describe SettingsController do
  # ::Rails.logger.error("...")
  render_views

  # Replace this with your real tests.
  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  it "should redirect when a language is set" do
    get :set_language, { :language => languages(:russian_language)}
    assert_not_nil(session[:locale])
    assert_equal languages(:russian_language).locale,session[:locale]
    assert_equal languages(:russian_language).id,session[:language_id]
    assert_redirected_to "/"
  end


  it "should redirect when a currency is set" do
    get :set_currency, { :currency => currencies(:euro_currency)}
    assert_not_nil(session[:currency_id])
    assert_equal currencies(:euro_currency).id,session[:currency_id]
    assert_redirected_to "/"
  end

  it "should redirect when a region is set" do
    get :set_region, { :region => regions(:peterburg_region)}
    assert_not_nil(session[:region_id])
    assert_equal regions(:peterburg_region).id,session[:region_id]
    assert_redirected_to "/"
  end

end
