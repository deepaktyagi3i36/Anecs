require 'spec_helper'

describe Myaccount::Community::PrivacyController, :type=>:controller do
  render_views

  # Activate authlogic
  setup :activate_authlogic

  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  it 'should inherit from MyshoppingController' do
    assert_kind_of MyaccountController, @controller
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
    end

    it "should get index again" do
      get :index
      assert_response :success
    end
  end
end
