require 'spec_helper'

describe Backoffice::Products::Properties::PropertiesController, :type=>:controller do
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
      assert_select "form#variant_properties_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :variant_property_filter => { :property_id => "%", :variant_id => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create variant_property" do
      assert_difference('VariantProperty.count') do
        post :create, :variant_property => {:variant_id => variants(:carbokick_with_banana_taste).id,
          :property_id => properties(:weight_property).id, :value =>"new value"}
      end
      assert_not_nil flash[:notice]
      variant_property = VariantProperty.find_by_variant_id_and_property_id(
        variants(:carbokick_with_banana_taste).id, properties(:weight_property).id)
      assert_redirected_to "/backoffice/products/properties/properties/edit?id=" + variant_property.to_param
    end

    it "should get edit" do
      get :edit, :id => variant_properties(:quantity_property_for_carbokick_with_banana_taste).to_param
      assert_response :success
    end

    it "should update variant_property" do
      post :update, :id => variant_properties(:quantity_property_for_carbokick_with_banana_taste).to_param,
        :variant_property => {:value => "new value"}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/properties/properties/edit?id=" + variant_properties(:quantity_property_for_carbokick_with_banana_taste).to_param
    end

    it "should destroy variant_property" do
      assert_difference('VariantProperty.count', -1) do
        delete :destroy, :id => variant_properties(:quantity_property_for_carbokick_with_banana_taste).to_param
      end
      assert_redirected_to "/backoffice/products/properties/properties"
    end
  end
end
