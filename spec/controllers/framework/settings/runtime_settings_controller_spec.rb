require 'spec_helper'

describe Framework::Settings::RuntimeSettingsController, :type=>:controller do
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
      assert_select "form#runtime_settings_filter"
      assert_select "form#runtime_settings_filter #runtime_setting_filter_name"
      assert_select "form#runtime_settings_filter #runtime_setting_filter_code"
      assert_select "form#runtime_settings_filter #runtime_setting_filter_about"
      assert_select "form#runtime_settings_filter #runtime_setting_filter_created_at_since"
      assert_select "form#runtime_settings_filter #runtime_setting_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :runtime_setting_filter => { :name => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create runtime setting" do
      assert_difference('RuntimeSetting.count') do
        post :create, :runtime_setting => { :name => "abrabra", :code => "abrabra", :about => "abrabra", :value => "ab"}
      end
      assert_not_nil flash[:notice]
      runtime_setting = RuntimeSetting.find_by_code("abrabra")
      assert_redirected_to "/framework/constants/runtime_settings/edit?id=" + runtime_setting.to_param
    end

    it "should get edit" do
      get :edit, :id => runtime_settings(:is_show_article_counters_runtime_setting).to_param
      assert_response :success
    end

    it "should update runtime setting" do
      post :update, :id => runtime_settings(:is_show_article_counters_runtime_setting).to_param, :runtime_setting => { :value => "value" }
      assert_not_nil flash[:notice]
      assert_redirected_to "/framework/constants/runtime_settings/edit?id=" + runtime_settings(:is_show_article_counters_runtime_setting).to_param
    end

    it "should destroy runtime setting" do
      assert_difference('RuntimeSetting.count', -1) do
        delete :destroy, :id => runtime_settings(:is_show_article_counters_runtime_setting).to_param
      end
      assert_redirected_to "/framework/constants/runtime_settings"
    end
  end
end
