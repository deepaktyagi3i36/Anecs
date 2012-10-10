require 'spec_helper'

describe Backoffice::Products::Properties::PatternsController, :type=>:controller do
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
      assert_select "form#patterns_filter"
      assert_select "form#patterns_filter #pattern_filter_title"
      assert_select "form#patterns_filter #pattern_filter_body"
      assert_select "form#patterns_filter #pattern_filter_created_at_since"
      assert_select "form#patterns_filter #pattern_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :pattern_filter => { :pattern_type_id => "%", :title => "%", :body => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create pattern" do
      assert_difference('Pattern.count') do
        post :create, :pattern => {:pattern_type_id => pattern_types(:instructions_pattern_type).id,
          :name => "new pattern", :title => "new pattern", :body => "new pattern"}
      end
      assert_not_nil flash[:notice]
      pattern = Pattern.find_by_title("new pattern")
      assert_redirected_to "/backoffice/products/properties/patterns/edit?id=" + pattern.to_param
    end

    it "should get edit" do
      get :edit, :id => patterns(:instruction_pattern).to_param
      assert_response :success
    end

    it "should update pattern" do
      post :update, :id => patterns(:instruction_pattern).to_param,
        :pattern => {:title => "Pattern1"}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/properties/patterns/edit?id=" + patterns(:instruction_pattern).to_param
    end

    it "should destroy pattern" do
      assert_difference('Pattern.count', -1) do
        delete :destroy, :id => patterns(:instruction_pattern).to_param
      end
      assert_redirected_to "/backoffice/products/properties/patterns"
    end
  end


end
