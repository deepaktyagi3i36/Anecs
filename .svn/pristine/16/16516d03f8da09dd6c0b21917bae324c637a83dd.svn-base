require 'spec_helper'

describe Backoffice::Website::Feedbacks::CallmebacksController, :type=>:controller do
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
      assert_select "form#callmebacks_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :callmeback_filter => { :title => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create callmeback" do
      assert_difference('Callmeback.count') do
        post :create, :callmeback => { :user_id => users(:quentin).id,
          :contact_type_id => contact_types(:order_contact_type).id,
          :contact_status_id => contact_statuses(:active_contact_status).id,
          :phone => "+78121234567", :title => "courier", :body => "courier",}
      end
      assert_not_nil flash[:notice]
      callmeback = Callmeback.find_by_title("courier")
      assert_redirected_to "/backoffice/supporter/tasks/callmebacks/edit?id=" + callmeback.to_param
    end

    it "should get edit" do
      get :edit, :id => callmebacks(:life_isnt_good_callmeback).to_param
      assert_response :success
    end

    it "should update callmeback" do
      post :update, :id => callmebacks(:life_isnt_good_callmeback).to_param, :callmeback => {
        :title => "callmeback at spb"}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/supporter/tasks/callmebacks/edit?id=" + callmebacks(:life_isnt_good_callmeback).to_param
    end

    it "should destroy callmeback" do
      assert_difference('Callmeback.count', -1) do
        delete :destroy, :id => callmebacks(:life_isnt_good_callmeback).to_param
      end
      assert_redirected_to "/backoffice/supporter/tasks/callmebacks"
    end
  end
end
