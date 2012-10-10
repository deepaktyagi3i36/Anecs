require 'spec_helper'

describe Backoffice::Products::Products::CategoriesController, :type=>:controller do
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
      assert_select "form#categories_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :category_filter => {:namel => "%",
          :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create category" do
      assert_difference('Category.count') do
        post :create, :category => {:code => "new category code", :name => "new category name",
            :parent_id => categories(:products_supplements_category).id, :about => "new category", :enabled =>1}
      end
      assert_not_nil flash[:notice]
      category = Category.find_by_name("new category name")
      assert_redirected_to "/backoffice/products/products/categories/edit?id=" + category.to_param
    end

    it "should get edit" do
      get :edit, :id => categories(:products_supplements_category).to_param
      assert_response :success
    end

    it "should update category" do
      post :update, :id => categories(:products_supplements_category).to_param,
          :category => {:name => "new category name", :parent_id => nil, :about => "new category", :enabled =>1}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/products/categories/edit?id=" + categories(:products_supplements_category).to_param
    end

    it "should destroy category" do
      assert_difference('Category.count', -1) do
        delete :destroy, :id => categories(:products_supplements_bycategory_anabolic_category).to_param
      end
      assert_redirected_to "/backoffice/products/products/categories"
    end
  end
end
