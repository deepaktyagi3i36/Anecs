require 'spec_helper'

describe Framework::Constants::AddressTypesController, :type=>:controller do
  render_views

  # Activate authlogic
  setup :activate_authlogic

  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  it 'should inherit from FrarmeworkController' do
    assert_kind_of FrameworkController, @controller
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
      assert_select "form#address_types_filter"
      assert_select "form#address_types_filter #address_type_filter_name"
      assert_select "form#address_types_filter #address_type_filter_code"
      assert_select "form#address_types_filter #address_type_filter_about"
      assert_select "form#address_types_filter #address_type_filter_created_at_since"
      assert_select "form#address_types_filter #address_type_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :address_type_filter => { :name => "", :code => "", :about => "",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create address_type" do
      assert_difference('AddressType.count') do
        post :create, :address_type => { :name => "cleaner", :code => "cleaner", :about => "cleaner" }
      end
      assert_not_nil flash[:notice]
      address_type = AddressType.find_by_code("cleaner")
      assert_redirected_to "/framework/constants/address_types/edit?id=" + address_type.to_param
    end

    it "should get edit" do
      get :edit, :id => address_types(:shipping_address_type).to_param
      assert_response :success
    end

    it "should update address_type" do
      post :update, :id => address_types(:shipping_address_type).to_param, :address_type => { :name => "new cleaner" }
      assert_not_nil flash[:notice]
      assert_redirected_to "/framework/constants/address_types/edit?id=" + address_types(:shipping_address_type).to_param
    end

    it "should not destroy address_type" do
      assert_difference('AddressType.count', 0) do
        delete :destroy, :id => address_types(:shipping_address_type).to_param
      end
      assert_redirected_to "/framework/constants/address_types"
    end

    it "should destroy address_type" do
      assert_difference('AddressType.count', -1) do
        delete :destroy, :id => address_types(:nofk_address_type).to_param
      end
      assert_redirected_to "/framework/constants/address_types"
    end
  end
end
