require 'spec_helper'

describe Framework::Constants::AnnouncementStatusesController, :type=>:controller do
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
      assert_select "form#announcement_statuses_filter"
      assert_select "form#announcement_statuses_filter #announcement_status_filter_name"
      assert_select "form#announcement_statuses_filter #announcement_status_filter_code"
      assert_select "form#announcement_statuses_filter #announcement_status_filter_about"
      assert_select "form#announcement_statuses_filter #announcement_status_filter_created_at_since"
      assert_select "form#announcement_statuses_filter #announcement_status_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :announcement_status_filter => {  :name => "", :code => "", :about => "",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create announcement_status" do
      assert_difference('AnnouncementStatus.count') do
        post :create, :announcement_status => { :name => "cleaner", :code => "cleaner", :about => "cleaner" }
      end
      assert_not_nil flash[:notice]
      announcement_status = AnnouncementStatus.find_by_code("cleaner")
      assert_redirected_to "/framework/constants/announcement_statuses/edit?id=" + announcement_status.to_param
    end

    it "should get edit" do
      get :edit, :id => announcement_statuses(:blocked_announcement_status).to_param
      assert_response :success
    end

    it "should update announcement_status" do
      post :update, :id => announcement_statuses(:blocked_announcement_status).to_param, :announcement_status => { }
      assert_not_nil flash[:notice]
      assert_redirected_to "/framework/constants/announcement_statuses/edit?id=" + announcement_statuses(:blocked_announcement_status).to_param
    end

    it "should destroy announcement_status" do
      assert_difference('AnnouncementStatus.count', -1) do
        delete :destroy, :id => announcement_statuses(:blocked_announcement_status).to_param
      end
      assert_redirected_to "/framework/constants/announcement_statuses"
    end
  end
end
