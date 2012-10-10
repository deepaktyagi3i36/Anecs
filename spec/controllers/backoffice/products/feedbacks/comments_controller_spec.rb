require 'spec_helper'

describe Backoffice::Products::Feedbacks::CommentsController, :type=>:controller do
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
      assert_select "form#comments_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :comment_filter => { :titlel => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create comment" do
      assert_difference('Comment.count') do
        post :create, :comment => {:product_id => products(:products_supplements_carbokick).id,
          :comment_status_id => comment_statuses(:active_comment_status).id,
          :comment_type_id => comment_types(:comment_comment_type).id,
          :user_id => users(:quentin).id, :author_id => nil,
          :title => "new comment", :body => "new comment", :rating => 1, :useful => 1, :useless =>1}
      end
      assert_not_nil flash[:notice]
      comment = Comment.find_by_title("new comment")
      assert_redirected_to "/backoffice/products/feebacks/comments/edit?id=" + comment.to_param
    end

    it "should get edit" do
      get :edit, :id => comments(:carbokick_comment).to_param
      assert_response :success
    end

    it "should update comment" do
      post :update, :id => comments(:carbokick_comment).to_param,
        :comment => {:title => "Comment1"}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/feebacks/comments/edit?id=" + comments(:carbokick_comment).to_param
    end

    it "should destroy comment" do
      assert_difference('Comment.count', -1) do
        delete :destroy, :id => comments(:carbokick_comment).to_param
      end
      assert_redirected_to "/backoffice/products/feebacks/comments"
    end
  end
end
