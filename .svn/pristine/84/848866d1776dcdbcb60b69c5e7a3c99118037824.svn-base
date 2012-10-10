require 'spec_helper'

describe Backoffice::Products::Products::BookcasesController, :type=>:controller do
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
      assert_select "form#bookcases_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :bookcase_filter => { :article_id => "", :product_id=> "",  :annotation=> "",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create bookcase" do
      assert_difference('Bookcase.count') do
        post :create, :bookcase => {:product_id => products(:products_supplements_dreamtan).id,
          :article_id => articles(:aminos_supplement_article).id,
          :annotation => "new bookcase for dreamtan", :position =>100}
      end
      assert_not_nil flash[:notice]
      bookcase = Bookcase.find_by_annotation("new bookcase for dreamtan")
      assert_redirected_to "/backoffice/products/products/bookcases/edit?id=" + bookcase.to_param
    end

    it "should get edit" do
      get :edit, :id => bookcases(:carbokick_aminos_bookcase).to_param
      assert_response :success
    end

    it "should update bookcase" do
      post :update, :id => bookcases(:carbokick_aminos_bookcase).to_param,
        :bookcase => {:annotation => "new bookcase name", :position =>10}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/products/bookcases/edit?id=" + bookcases(:carbokick_aminos_bookcase).to_param
    end

    it "should destroy bookcase" do
      assert_difference('Bookcase.count', -1) do
        delete :destroy, :id => bookcases(:pipkino_protein_bookcase).to_param
      end
      assert_redirected_to "/backoffice/products/products/bookcases"
    end
  end
end
