require 'spec_helper'

describe Backoffice::Products::Properties::ProductTypesController, :type=>:controller do
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
      assert_select "form#infoitem_types_filter"
      assert_select "form#infoitem_types_filter #infoitem_type_filter_name"
      assert_select "form#infoitem_types_filter #infoitem_type_filter_created_at_since"
      assert_select "form#infoitem_types_filter #infoitem_type_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :infoitem_type_filter => { :name => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create infoitem_type" do
      assert_difference('ProductType.count') do
        post :create, :infoitem_type => { :name => "cleaner", :code => "cleaner", :about => "cleaner"}
      end
      assert_not_nil flash[:notice]
      infoitem_type = ProductType.find_by_code("cleaner")
      assert_redirected_to "/backoffice/products/properties/infoitem_types/edit?id=" + infoitem_type.to_param
    end

    it "should get edit" do
      get :edit, :id => infoitem_types(:supplement_products_type).to_param
      assert_response :success
    end

    it "should update infoitem_type" do
      post :update, :id => infoitem_types(:supplement_products_type).to_param, :infoitem_type => {
        :name => "new infoitem type"}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/properties/infoitem_types/edit?id=" + infoitem_types(:supplement_products_type).to_param
    end

    it "should not destroy infoitem_type" do
      assert_difference('ProductType.count', 0) do
        delete :destroy, :id => infoitem_types(:supplement_products_type).to_param
      end
      assert_redirected_to "/backoffice/products/properties/infoitem_types"
    end

    it "should destroy infoitem_type" do
      assert_difference('ProductType.count', -1) do
        delete :destroy, :id => infoitem_types(:nofk_products_type).to_param
      end
      assert_redirected_to "/backoffice/products/properties/infoitem_types"
    end
  end
end
