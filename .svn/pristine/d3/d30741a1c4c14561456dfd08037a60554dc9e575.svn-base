require 'spec_helper'

describe Backoffice::Products::Feedbacks::RequestsController, :type=>:controller do
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
      assert_select "form#requests_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :order_filter => { :titlel => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create request" do
      assert_difference('Request.count') do
        post :create, :request => {:parent_id => nil,
          :product_id => products(:products_supplements_carbokick).id,
          :request_status_id => request_statuses(:active_request_status).id,
          :user_id => users(:quentin).id, :author_id =>  nil,
          :title => "new request", :body => "new request", :rating => 1, :useful => 1, :useless =>1}
      end
      assert_not_nil flash[:notice]
      request = Request.find_by_title("new request")
      assert_redirected_to "/backoffice/products/feebacks/requests/edit?id=" + request.to_param
    end

    it "should get edit" do
      get :edit, :id => requests(:carbokick_request).to_param
      assert_response :success
    end

    it "should update request" do
      post :update, :id => requests(:carbokick_request).to_param,
        :request => {:title => "Request1"}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/feebacks/requests/edit?id=" + requests(:carbokick_request).to_param
    end

    it "should destroy request" do
      assert_difference('Request.count', -1) do
        delete :destroy, :id => requests(:carbokick_request).to_param
      end
      assert_redirected_to "/backoffice/products/feebacks/requests"
    end
  end
end
