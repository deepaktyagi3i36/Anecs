require 'spec_helper'

describe UsersController do
  render_views

  # Activate authlogic
  setup :activate_authlogic

  it "should allow_signup" do
    assert_difference 'User.count' do
      create_user
      assert_response :redirect
    end
  end

  it "should require_login_on_signup" do
    assert_no_difference 'User.count' do
      create_user(:login => nil)
      assert assigns(:user).errors.on(:login)
      assert_response :success
    end
  end

  it "should require_password_on_signup" do
    assert_no_difference 'User.count' do
      create_user(:password => nil)
      assert assigns(:user).errors.on(:password)
      assert_response :success
    end
  end

  it "should require_password_confirmation_on_signup" do
    assert_no_difference 'User.count' do
      create_user(:password_confirmation => nil)
      assert assigns(:user).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  it "should require_email_on_signup" do
    assert_no_difference 'User.count' do
      create_user(:email => nil)
      assert assigns(:user).errors.on(:email)
      assert_response :success
    end
  end

  it "should sign_up_user_with_activation_code" do
    create_user
    assigns(:user).reload
    assert_not_nil assigns(:user).activation_code
  end

  it "should activate_user" do
    assert_nil User.authenticate('aaron', 'test')
    get :activate, :activation_code => users(:aaron).activation_code
    assert_redirected_to root_path
    assert_not_nil flash[:notice]
    assert_equal users(:aaron), User.authenticate('aaron', 'test')
  end

  it "should not_activate_user_without_key" do
    get :activate
    assert_nil flash[:notice]
  # TODO: uncomment
  #rescue ActionController::RoutingError
  #  # in the event your routes deny this, we'll just bow out gracefully.
  end

  it "should not_activate_user_with_blank_key" do
    get :activate, :activation_code => ''
    assert_nil flash[:notice]
  # TODO: uncomment
  #rescue ActionController::RoutingError
  #  # well played, sir
  end

  protected
    def create_user(options = {})
      post :create, :user => { :login => 'quire',
        :email => 'quire@example.com', :firstname => "Facundo", :lastname => "Dominguez", :nickname => "fdominguez",
        :password => 'quire', :password_confirmation => 'quire', :captcha_text => "test"}.merge(options)
    end
end


