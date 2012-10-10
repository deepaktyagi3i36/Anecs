require 'spec_helper'

describe Framework::Heartbeat::UserRolesController, :type=>:controller do
  render_views

  # Activate authlogic
  setup :activate_authlogic

  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  it 'should inherit from frameworkController' do
    assert_kind_of frameworkController, @controller
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
      assert_select "form#user_roles_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :user_role_filter => { :user_id => "", :role_id => "",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create user role" do
      assert_difference('UserRole.count') do
        post :create, :user_role => {:user_id => users(:aaron).id,
          :role_id => roles(:manager_role).id}
      end
      assert_not_nil flash[:notice]
      user_role = UserRole.find_by_user_id_and_role_id(
        users(:aaron).id, roles(:manager_role).id)
      assert_redirected_to "/framework/heartbeat/user_roles/edit?id=" + user_role.to_param
    end

    it "should get edit" do
      get :edit, :id => user_roles(:aaron_administrator_role).to_param
      assert_response :success
    end

    it "should update user role" do
      post :update, :id => user_roles(:aaron_administrator_role).to_param,
        :user_role => {:role_id => roles(:messanger_role).id}
      assert_not_nil flash[:notice]
      assert_redirected_to "/framework/heartbeat/user_roles/edit?id=" + user_roles(:aaron_administrator_role).to_param
    end

    it "should destroy user role" do
      assert_difference('UserRole.count', -1) do
        delete :destroy, :id => user_roles(:quentin_administrator_role).to_param
      end
      assert_redirected_to "/framework/heartbeat/user_roles"
    end
  end
end
