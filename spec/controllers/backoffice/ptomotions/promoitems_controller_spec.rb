require 'spec_helper'

describe Backoffice::Promotions::PromoitemsController, :type=>:controller do
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
      assert_select "form#promoitems_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :promoitem_filter => { :promotion_id => "", :product_id=> "",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create promoitem" do
      assert_difference('Promoitem.count') do
        post :create, :promoitem => {:product_id => products(:products_supplements_dreamtan).id,
          :promotion_id => promotions(:newitem_infoitem).id}
      end
      assert_not_nil flash[:notice]
      promoitem = Promoitem.find_by_promotion_id_and_product_id(
        promotions(:newitem_infoitem).id,
        products(:products_supplements_dreamtan).id)
      assert_redirected_to "/backoffice/products/promotions/promoitems/edit?id=" + promoitem.to_param
    end

    it "should get edit" do
      get :edit, :id => promoitems(:carbokick_feburary23_promoitem).to_param
      assert_response :success
    end

    it "should update promoitem" do
      post :update, :id => promoitems(:carbokick_feburary23_promoitem).to_param,
        :promoitem => {:promotion_id => promotions(:newyear_action).id}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/promotions/promoitems/edit?id=" + promoitems(:carbokick_feburary23_promoitem).to_param
    end

    it "should destroy promoitem" do
      assert_difference('Promoitem.count', -1) do
        delete :destroy, :id => promoitems(:carbokick_feburary23_promoitem).to_param
      end
      assert_redirected_to "/backoffice/products/promotions/promoitems"
    end
  end
end
