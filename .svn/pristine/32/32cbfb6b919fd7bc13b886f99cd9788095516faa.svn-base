require 'spec_helper'

describe Framework::Constants::OrderStatesController, :type=>:controller do
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
      assert_select "form#order_states_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :order_filter => { :namel => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create order_state" do
      assert_difference('OrderState.count') do
        post :create, :order_state => { :name => "cleaner", :code => "cleaner", :about => "cleaner" }
      end
      assert_not_nil flash[:notice]
      order_state = OrderState.find_by_code("cleaner")
      assert_redirected_to "/framework/constants/order_states/edit?id=" + order_state.to_param
    end

    it "should get edit" do
      get :edit, :id => order_states(:closed_order_state).to_param
      assert_response :success
    end

    it "should update order_state" do
      post :update, :id => order_states(:closed_order_state).to_param, :order_state => { }
      assert_not_nil flash[:notice]
      assert_redirected_to "/framework/constants/order_states/edit?id=" + order_states(:closed_order_state).to_param
    end

    it "should destroy order_state" do
      assert_difference('OrderState.count', -1) do
        delete :destroy, :id => order_states(:closed_order_state).to_param
      end
      assert_redirected_to "/framework/constants/order_states"
    end
  end
end
