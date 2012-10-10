require 'spec_helper'

describe Backoffice::Website::Feedbacks::FeedbacksController, :type=>:controller do
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
      assert_select "form#feedbacks_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :feedback_filter => { :title => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create feedback" do
      assert_difference('Feedback.count') do
        post :create, :feedback => { :user_id => users(:quentin).id,
          :contact_type_id => contact_types(:order_contact_type).id,
          :contact_status_id => contact_statuses(:active_contact_status).id,
          :title => "courier", :body => "courier",}
      end
      assert_not_nil flash[:notice]
      feedback = Feedback.find_by_title("courier")
      assert_redirected_to "/backoffice/supporter/tasks/feedbacks/edit?id=" + feedback.to_param
    end

    it "should get edit" do
      get :edit, :id => feedbacks(:life_isnt_good_feedback).to_param
      assert_response :success
    end

    it "should update feedback" do
      post :update, :id => feedbacks(:life_isnt_good_feedback).to_param, :feedback => {
        :title => "feedback at spb"}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/supporter/tasks/feedbacks/edit?id=" + feedbacks(:life_isnt_good_feedback).to_param
    end

    it "should destroy feedback" do
      assert_difference('Feedback.count', -1) do
        delete :destroy, :id => feedbacks(:life_isnt_good_feedback).to_param
      end
      assert_redirected_to "/backoffice/supporter/tasks/feedbacks"
    end
  end
end
