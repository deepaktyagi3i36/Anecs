require 'spec_helper'

describe Framework::Settings::LanguagesController, :type=>:controller do
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
      assert_select "form#languages_filter"
      assert_select "form#languages_filter #language_filter_name"
      assert_select "form#languages_filter #language_filter_code"
      assert_select "form#languages_filter #language_filter_about"
      assert_select "form#languages_filter #language_filter_created_at_since"
      assert_select "form#languages_filter #language_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :language_filter => { :name => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create language" do
      assert_difference('Language.count') do
        post :create, :language => { :name => "abrabra", :code => "abrabra", :about => "abrabra", :locale => "ab", :enabled => 1 }
      end
      assert_not_nil flash[:notice]
      language = Language.find_by_code("abrabra")
      assert_redirected_to "/framework/settings/languages/edit?id=" + language.to_param
    end

    it "should get edit" do
      get :edit, :id => languages(:russian_language).to_param
      assert_response :success
    end

    it "should update language" do
      post :update, :id => languages(:russian_language).to_param, :language => { }
      assert_not_nil flash[:notice]
      assert_redirected_to "/framework/settings/languages/edit?id=" + languages(:russian_language).to_param
    end

    it "should destroy language" do
      assert_difference('Language.count', -1) do
        delete :destroy, :id => languages(:russian_language).to_param
      end
      assert_redirected_to "/framework/settings/languages"
    end
  end
end
