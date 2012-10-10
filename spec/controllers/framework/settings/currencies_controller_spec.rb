require 'spec_helper'

describe Framework::Settings::CurrenciesController, :type=>:controller do
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
      assert_select "form#currencies_filter"
      assert_select "form#currencies_filter #currency_filter_name"
      assert_select "form#currencies_filter #currency_filter_code"
      assert_select "form#currencies_filter #currency_filter_about"
      assert_select "form#currencies_filter #currency_filter_created_at_since"
      assert_select "form#currencies_filter #currency_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :currency_filter => { :name => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create currency" do
      assert_difference('Currency.count') do
        post :create, :currency => { :name => "abrabra", :code => "abrabra", :about => "abrabra", :sign => "ab", :enabled =>1 }
      end
      assert_not_nil flash[:notice]
      currency = Currency.find_by_code("abrabra")
      assert_redirected_to "/framework/settings/currencies/edit?id=" + currency.to_param
    end

    it "should get edit" do
      get :edit, :id => currencies(:euro_currency).to_param
      assert_response :success
    end

    it "should update currency" do
      post :update, :id => currencies(:euro_currency).to_param, :currency => { }
      assert_not_nil flash[:notice]
      assert_redirected_to "/framework/settings/currencies/edit?id=" + currencies(:euro_currency).to_param
    end

    it "should destroy currency" do
      assert_difference('Currency.count', -1) do
        delete :destroy, :id => currencies(:euro_currency).to_param
      end
      assert_redirected_to "/framework/settings/currencies"
    end
  end
end
