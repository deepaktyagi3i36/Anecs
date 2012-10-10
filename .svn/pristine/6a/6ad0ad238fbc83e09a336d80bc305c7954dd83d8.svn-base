require 'spec_helper'

describe Backoffice::Products::Products::VariantsController, :type=>:controller do
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
      assert_select "form#variants_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end


    it "should get index with filter" do
      get :index, :variant_filter => {:namel => "%",
          :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create variant" do
      assert_difference('Variant.count') do
        post :create, :variant => {:product_id => infoitems(:products_supplements_carbokick).id,
            :name => "new variant", :price => 0,
            :currency_id => currencies(:rouble_currency).id, :enabled =>1}
      end
      assert_not_nil flash[:notice]
      variant = Variant.find_by_name("new variant")
      assert_redirected_to "/backoffice/products/products/variants/edit?id=" + variant.to_param
    end

    it "should get edit" do
      get :edit, :id => variants(:carbokick_with_banana_taste).to_param
      assert_response :success
    end

    it "should update variant" do
      post :update, :id => variants(:carbokick_with_banana_taste).to_param,
          :variant => {:enabled =>1}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/products/variants/edit?id=" + variants(:carbokick_with_banana_taste).to_param
    end

    it "should not destroy variant" do
      assert_difference('Variant.count', 0) do
        delete :destroy, :id => variants(:carbokick_with_banana_taste).to_param
      end
      assert_redirected_to "/backoffice/products/products/variants"
    end

    it "should destroy variant" do
      assert_difference('Variant.count', -1) do
        delete :destroy, :id => variants(:carbokick_with_nofk_taste).to_param
      end
      assert_redirected_to "/backoffice/products/products/variants"
    end
  end
end
