require 'spec_helper'

describe Framework::Constants::ComplaintTypesController, :type=>:controller do
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
      assert_select "form#complaint_types_filter"
      assert_select "form#complaint_types_filter #complaint_type_filter_name"
      assert_select "form#complaint_types_filter #complaint_type_filter_code"
      assert_select "form#complaint_types_filter #complaint_type_filter_about"
      assert_select "form#complaint_types_filter #complaint_type_filter_created_at_since"
      assert_select "form#complaint_types_filter #complaint_type_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :complaint_type_filter => {  :name => "", :code => "", :about => "",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create complaint_type" do
      assert_difference('ComplaintType.count') do
        post :create, :complaint_type => { :name => "cleaner", :code => "cleaner", :about => "cleaner" }
      end
      assert_not_nil flash[:notice]
      complaint_type = ComplaintType.find_by_code("cleaner")
      assert_redirected_to "/framework/constants/complaint_types/edit?id=" + complaint_type.to_param
    end

    it "should get edit" do
      get :edit, :id => complaint_types(:order_complaint_type).to_param
      assert_response :success
    end

    it "should update complaint_type" do
      post :update, :id => complaint_types(:order_complaint_type).to_param, :complaint_type => {:about => "instruction1" }
      assert_not_nil flash[:notice]
      assert_redirected_to "/framework/constants/complaint_types/edit?id=" + complaint_types(:order_complaint_type).to_param
    end

    it "should not destroy complaint_type" do
      assert_difference('ComplaintType.count', 0) do
        delete :destroy, :id => complaint_types(:order_complaint_type).to_param
      end
      assert_redirected_to "/framework/constants/complaint_types"
    end

    it "should destroy complaint_type" do
      assert_difference('ComplaintType.count', -1) do
        delete :destroy, :id => complaint_types(:nofk_complaint_type).to_param
      end
      assert_redirected_to "/framework/constants/complaint_types"
    end
  end
end
