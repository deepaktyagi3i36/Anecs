require 'spec_helper'

describe Backoffice::Products::Products::ProductsController, :type=>:controller do
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
      assert_select "form#products_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :infoitem_filter => {:namel => "%",
          :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create product" do
      assert_difference('Product.count') do
        post :create, :product => {:product_type_id => product_types(:supplement_products_type).id,
            :code => "new product", :name => "new product", :sketch => "new product",
            :about => "new product",
            :permalink => "new_permalink", :metakeywords => "new metakeywords",
            :metadescription => "new metadescription", :wwwaddress => "new wwwaddress",
            :enabled =>1}
      end
      assert_not_nil flash[:notice]
      product = Product.find_by_name("new product")
      assert_redirected_to "/backoffice/products/products/products/edit?id=" + product.to_param
    end

    it "should get edit" do
      get :edit, :id => products(:products_supplements_carbokick).to_param
      assert_response :success
    end

    it "should update product" do
      post :update, :id => products(:products_supplements_carbokick).to_param,
          :product => {:name => "new product name", :about => "new product", :enabled =>1}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/products/products/edit?id=" + products(:products_supplements_carbokick).to_param
    end

    it "should destroy product" do
      assert_difference('Product.count', -1) do
        delete :destroy, :id => products(:products_supplements_dreamtan).to_param
      end
      assert_redirected_to "/backoffice/products/products/products"
    end

    it "shouldn't destroy product that has variants in shopping_cart" do
      assert_no_difference('Product.count') do
        delete :destroy, :id => products(:products_supplements_carbokick).to_param
      end
      assert_redirected_to '/backoffice/products/products/products'
    end
  end
end
