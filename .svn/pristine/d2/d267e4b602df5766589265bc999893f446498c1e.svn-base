require 'spec_helper'

describe Backoffice::Products::Products::ConnectionsController, :type=>:controller do
  render_views

  # Activate authlogic
  setup :activate_authlogic

  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  it 'should inherit from BackofficeController' do
    assert_kind_of BackofficeController, @controller
  end

  describe "user not logged in" do
    it "should not GET index" do
      get :index
      assert_redirected_to "/sessions/new"
    end
  end

  describe "user logged in as root" do
    before(:each) do
      UserSession.create(users(:root))
    end

    it "should get index" do
      get :index
      assert_response :success
      assert_select "form#connections_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :connection_filter => { :category_id => "", :product_id => "",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create connection" do
      assert_difference('Connection.count') do
        post :create, :connection => {:product_id => products(:products_supplements_carbokick).id,
          :category_id => categories(:products_supplements_bycategory_protein_category).id, :bubble =>1}
      end
      assert_not_nil flash[:notice]
      connection = Connection.find_by_category_id_and_product_id(
        categories(:products_supplements_bycategory_protein_category).id,
        products(:products_supplements_carbokick).id)
      assert_redirected_to "/backoffice/products/products/connections/edit?id=" + connection.to_param
    end

    it "should get edit" do
      get :edit, :id => connections(:products_carbokick_in_ababolic_category).to_param
      assert_response :success
    end

    it "should update connection" do
      post :update, :id => connections(:products_carbokick_in_ababolic_category).to_param,
        :connection => {:bubble =>1}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/products/connections/edit?id=" + connections(:products_carbokick_in_ababolic_category).to_param
    end

    it "should destroy connection" do
      assert_difference('Connection.count', -1) do
        delete :destroy, :id => connections(:products_carbokick_in_ababolic_category).to_param
      end
      assert_redirected_to "/backoffice/products/products/connections"
    end
  end
end
