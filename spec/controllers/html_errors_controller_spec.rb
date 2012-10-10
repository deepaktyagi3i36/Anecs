require 'spec_helper'

describe HtmlErrorsController do
  # ::Rails.logger.error("...")
  render_views

  # Activate authlogic
  setup :activate_authlogic

  # Replace this with your real tests.
  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  it "should get page404" do
    get :page404
    assert_response :success
  end

  it "should get page500" do
    get :page500
    assert_response :success
  end
end
