require 'spec_helper'

describe Backoffice::Settings::StorehousesController, :type=>:controller do
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
      assert_select "form#storehouses_filter"
      assert_select "form#storehouses_filter #storehouse_filter_name"
      assert_select "form#storehouses_filter #storehouse_filter_created_at_since"
      assert_select "form#storehouses_filter #storehouse_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :storehouse_filter => { :name => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create storehouse" do
      assert_difference('Storehouse.count') do
        post :create, :storehouse => { :name => "storehouse at spb",
          :about => "storehouse at spb",
          :region_id => regions(:peterburg_region).id, :enabled => 1 }
      end
      assert_not_nil flash[:notice]
      storehouse = Storehouse.find_by_name("storehouse at spb")
      assert_redirected_to "/backoffice/settings/storehouses/edit?id=" + storehouse.to_param
    end

    it "should get edit" do
      get :edit, :id => storehouses(:peterburg_storehouse).to_param
      assert_response :success
    end

    it "should update storehouse" do
      post :update, :id => storehouses(:peterburg_storehouse).to_param, :storehouse => {
        :name => "storehouse at spb", :about => "storehouse at spb",
        :region_id => regions(:peterburg_region).id, :enabled => 1 }
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/settings/storehouses/edit?id=" + storehouses(:peterburg_storehouse).to_param
    end

    it "should destroy storehouse" do
      assert_difference('Storehouse.count', -1) do
        delete :destroy, :id => storehouses(:peterburg_storehouse).to_param
      end
      assert_redirected_to "/backoffice/settings/storehouses"
    end
  end
end
