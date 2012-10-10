require 'spec_helper'

describe Framework::Constants::PromotionTypesController, :type=>:controller do
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
      assert_select "form#promotion_types_filter"
      assert_select "form#promotion_types_filter #promotion_type_filter_name"
      assert_select "form#promotion_types_filter #promotion_type_filter_code"
      assert_select "form#promotion_types_filter #promotion_type_filter_about"
      assert_select "form#promotion_types_filter #promotion_type_filter_created_at_since"
      assert_select "form#promotion_types_filter #promotion_type_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :promotion_type_filter => { :name => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create promotion type" do
      assert_difference('PromotionType.count') do
        post :create, :promotion_type => { :name => "abrabra", :code => "abrabra", :about => "abrabra"}
      end
      assert_not_nil flash[:notice]
      promotion_type = PromotionType.find_by_code("abrabra")
      assert_redirected_to "/framework/constants/promotion_types/edit?id=" + promotion_type.to_param
    end

    it "should get edit" do
      get :edit, :id => promotion_types(:action_promotion_type).to_param
      assert_response :success
    end

    it "should update promotion type" do
      post :update, :id => promotion_types(:action_promotion_type).to_param, :promotion_type => { }
      assert_not_nil flash[:notice]
      assert_redirected_to "/framework/constants/promotion_types/edit?id=" + promotion_types(:action_promotion_type).to_param
    end

    it "should not destroy promotion type" do
      assert_difference('PromotionType.count', 0) do
        delete :destroy, :id => promotion_types(:action_promotion_type).to_param
      end
      assert_redirected_to "/framework/constants/promotion_types"
    end

    it "should destroy promotion type" do
      assert_difference('PromotionType.count', -1) do
        delete :destroy, :id => promotion_types(:nofk_promotion_type).to_param
      end
      assert_redirected_to "/framework/constants/promotion_types"
    end
  end
end
