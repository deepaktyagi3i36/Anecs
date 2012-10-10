require 'spec_helper'

describe Backoffice::Settings::RegionsController, :type=>:controller do
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
      assert_select "form#regions_filter"
      assert_select "form#regions_filter #region_filter_name"
      assert_select "form#regions_filter #region_filter_code"
      assert_select "form#regions_filter #region_filter_about"
      assert_select "form#regions_filter #region_filter_created_at_since"
      assert_select "form#regions_filter #region_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :region_filter => {:name => "%",
          :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create region" do
      assert_difference('Region.count') do
        post :create, :region => {:name => "abrabra", :code => "abrabra",
            :about => "abrabra", :title => "abrabra",
            :phone => "+78129094766", :enabled => 1}
      end
      assert_not_nil flash[:notice]
      region = Region.find_by_code("abrabra")
      assert_redirected_to "/backoffice/settings/regions/edit?id=" + region.to_param
    end

    it "should get edit" do
      get :edit, :id => regions(:moscow_region).to_param
      assert_response :success
    end

    it "should update region" do
      post :update, :id => regions(:moscow_region).to_param, :region => {}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/settings/regions/edit?id=" + regions(:moscow_region).to_param
    end

    it "should not destroy region" do
      assert_difference('Region.count', 0) do
        delete :destroy, :id => regions(:moscow_region).to_param
      end
      assert_redirected_to "/backoffice/settings/regions"
    end

    it "should destroy region" do
      assert_difference('Region.count', -1) do
        delete :destroy, :id => regions(:nofk_region).to_param
      end
      assert_redirected_to "/backoffice/settings/regions"
    end
  end
end
