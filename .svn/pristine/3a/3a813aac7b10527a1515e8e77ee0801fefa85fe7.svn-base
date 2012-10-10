require 'spec_helper'

describe Backoffice::Products::Properties::ProductTypePropertiesController, :type=>:controller do
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
      assert_select "form#product_type_properties_filter"
      assert_select "form#product_type_properties_filter #product_type_property_filter_property_id"
      assert_select "form#product_type_properties_filter #product_type_property_filter_product_type_id"
      assert_select "form#product_type_properties_filter #product_type_property_filter_created_at_since"
      assert_select "form#product_type_properties_filter #product_type_property_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :product_type_property_filter => {:property_id => "", :product_type_id => "",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create product_type_property" do
      assert_difference('ProductTypeProperty.count') do
        post :create, :product_type_property => {:product_type_id => product_types(:supplement_products_type).id,
          :property_id => properties(:weight_property).id}
      end
      assert_not_nil flash[:notice]
      product_type_property = ProductTypeProperty.find_by_product_type_id_and_property_id(
        product_types(:supplement_products_type).id, properties(:weight_property).id)
      assert_redirected_to "/backoffice/products/properties/product_type_properties/edit?id=" + product_type_property.to_param
    end

    it "should get edit" do
      get :edit, :id => product_type_properties(:quantity_in_supplement_product_type).to_param
      assert_response :success
    end

    it "should update product_type_property" do
      post :update, :id => product_type_properties(:quantity_in_supplement_product_type).to_param,
        :product_type_property => {:property_id => properties(:taste_property).id}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/properties/product_type_properties/edit?id=" + product_type_properties(:quantity_in_supplement_product_type).to_param
    end

    it "should destroy product_type_property" do
      assert_difference('ProductTypeProperty.count', -1) do
        delete :destroy, :id => product_type_properties(:quantity_in_supplement_product_type).to_param
      end
      assert_redirected_to "/backoffice/products/properties/product_type_properties"
    end
  end
end
