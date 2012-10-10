require 'spec_helper'

describe Backoffice::Website::Feedbacks::ComplaintsController, :type=>:controller do
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
      assert_select "form#complaints_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :complaint_filter => { :title => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create complaint" do
      assert_difference('Complaint.count') do
        post :create, :complaint => { :user_id => users(:quentin).id,
          :complaint_type_id => complaint_types(:order_complaint_type).id,
          :complaint_status_id => complaint_statuses(:active_complaint_status).id,
          :title => "courier", :body => "courier",}
      end
      assert_not_nil flash[:notice]
      complaint = Complaint.find_by_title("courier")
      assert_redirected_to "/backoffice/supporter/tasks/complaints/edit?id=" + complaint.to_param
    end

    it "should get edit" do
      get :edit, :id => complaints(:life_isnt_good_complaint).to_param
      assert_response :success
    end

    it "should update complaint" do
      post :update, :id => complaints(:life_isnt_good_complaint).to_param, :complaint => {
        :title => "complaint at spb"}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/supporter/tasks/complaints/edit?id=" + complaints(:life_isnt_good_complaint).to_param
    end

    it "should destroy complaint" do
      assert_difference('Complaint.count', -1) do
        delete :destroy, :id => complaints(:life_isnt_good_complaint).to_param
      end
      assert_redirected_to "/backoffice/supporter/tasks/complaints"
    end
  end

end
