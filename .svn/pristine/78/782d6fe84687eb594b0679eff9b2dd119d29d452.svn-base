require 'spec_helper'

describe ProductsController do
  # ::Rails.logger.error("...")
  render_views

  # Activate authlogic
  setup :activate_authlogic

  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  it "should get index" do
    get :index
    assert_response :success
  end

  it "should show product" do
    get :show, :category_id => categories(:products_supplements_bycategory_anabolic_category).to_param,
      :product_id => products(:products_supplements_carbokick).to_param
    assert_response :success
  end
end
