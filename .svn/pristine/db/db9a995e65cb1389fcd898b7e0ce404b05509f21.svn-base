require 'spec_helper'

describe VacanciesController do
  # ::Rails.logger.error("...")
  render_views

  # Activate authlogic
  setup :activate_authlogic

  # Replace this with your real tests.
  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  it "should get index" do
    get :index
    assert_response :success
  end

  it "should get show" do
    get :show, :id => vacancies(:courier_at_peterburg).to_param
    assert_response :success
  end


end
