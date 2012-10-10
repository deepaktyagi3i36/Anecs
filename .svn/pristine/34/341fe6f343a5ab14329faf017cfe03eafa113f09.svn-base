require 'spec_helper'

describe Backoffice::Promotions::PromotionsController, :type=>:controller do
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
      assert_select "form#promotions_filter"
      assert_select "form#promotions_filter #promotion_filter_title"
      assert_select "form#promotions_filter #promotion_filter_body"
      assert_select "form#promotions_filter #promotion_filter_created_at_since"
      assert_select "form#promotions_filter #promotion_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :promotion_filter => { :promotion_type_id => "%", :title => "%", :body => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create promotion" do
      assert_difference('Promotion.count') do
        post :create, :promotion => {:promotion_type_id => promotion_types(:action_promotion_type).id,
          :code => "new promotion", :name => "new promotion", :about => "new promotion",
          :title => "new promotion", :body => "new promotion",
          :begin_dt => 5.days.ago, :finish_dt => 1.days.ago}
      end
      assert_not_nil flash[:notice]
      promotion = Promotion.find_by_title("new promotion")
      assert_redirected_to "/backoffice/promotions/promotions/edit?id=" + promotion.to_param
    end

    it "should get edit" do
      get :edit, :id => promotions(:feburary23_action).to_param
      assert_response :success
    end

    it "should update promotion" do
      post :update, :id => promotions(:feburary23_action).to_param,
        :promotion => {:title => "Promotion1"}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/promotions/promotions/edit?id=" + promotions(:feburary23_action).to_param
    end

    it "should destroy promotion" do
      assert_difference('Promotion.count', -1) do
        delete :destroy, :id => promotions(:feburary23_action).to_param
      end
      assert_redirected_to "/backoffice/promotions/promotions"
    end
  end
end
