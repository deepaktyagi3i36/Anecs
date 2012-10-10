require 'spec_helper'

describe Framework::Constants::CommentStatusesController, :type=>:controller do
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
      assert_select "form#comment_statuses_filter"
      assert_select "form#comment_statuses_filter #comment_status_filter_name"
      assert_select "form#comment_statuses_filter #comment_status_filter_code"
      assert_select "form#comment_statuses_filter #comment_status_filter_about"
      assert_select "form#comment_statuses_filter #comment_status_filter_created_at_since"
      assert_select "form#comment_statuses_filter #comment_status_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :comment_status_filter => {  :name => "", :code => "", :about => "",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create comment_status" do
      assert_difference('CommentStatus.count') do
        post :create, :comment_status => { :name => "cleaner", :code => "cleaner", :about => "cleaner" }
      end
      assert_not_nil flash[:notice]
      comment_status = CommentStatus.find_by_code("cleaner")
      assert_redirected_to "/framework/constants/comment_statuses/edit?id=" + comment_status.to_param
    end

    it "should get edit" do
      get :edit, :id => comment_statuses(:blocked_comment_status).to_param
      assert_response :success
    end

    it "should update comment_status" do
      post :update, :id => comment_statuses(:blocked_comment_status).to_param, :comment_status => { }
      assert_not_nil flash[:notice]
      assert_redirected_to "/framework/constants/comment_statuses/edit?id=" + comment_statuses(:blocked_comment_status).to_param
    end

    it "should destroy comment_status" do
      assert_difference('CommentStatus.count', -1) do
        delete :destroy, :id => comment_statuses(:blocked_comment_status).to_param
      end
      assert_redirected_to "/framework/constants/comment_statuses"
    end
  end
end
