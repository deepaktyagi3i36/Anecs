require 'spec_helper'

describe Framework::Settings::CountriesController, :type=>:controller do
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
      assert_select "form#countries_filter"
      assert_select "form#countries_filter #country_filter_name"
      assert_select "form#countries_filter #country_filter_code"
      assert_select "form#countries_filter #country_filter_about"
      assert_select "form#countries_filter #country_filter_created_at_since"
      assert_select "form#countries_filter #country_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :country_filter => { :name => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create country" do
      assert_difference('Country.count') do
        post :create, :country => { :name => "cleaner", :code => "cleaner", :about => "cleaner" }
      end
      assert_not_nil flash[:notice]
      country = Country.find_by_code("cleaner")
      assert_redirected_to "/framework/settings/countries/edit?id=" + country.to_param
    end

    it "should get edit" do
      get :edit, :id => countries(:usa_country).to_param
      assert_response :success
    end

    it "should update country" do
      post :update, :id => countries(:usa_country).to_param, :country => { }
      assert_not_nil flash[:notice]
      assert_redirected_to "/framework/settings/countries/edit?id=" + countries(:usa_country).to_param
    end

    it "should destroy country" do
      assert_difference('Country.count', -1) do
        delete :destroy, :id => countries(:usa_country).to_param
      end
      assert_redirected_to "/framework/settings/countries"
    end
  end
end
