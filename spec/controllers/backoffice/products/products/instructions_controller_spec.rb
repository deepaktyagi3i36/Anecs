require 'spec_helper'

describe Backoffice::Products::Products::InstructionsController, :type=>:controller do
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
      assert_select "form#instructions_filter"
      assert_select "form#instructions_filter #instruction_filter_title"
      assert_select "form#instructions_filter #instruction_filter_body"
      assert_select "form#instructions_filter #instruction_filter_created_at_since"
      assert_select "form#instructions_filter #instruction_filter_created_at_till"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :instuction_filter => { :product_id => "", :title => "", :body => "",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create instruction" do
      assert_difference('Instruction.count') do
        post :create, :instruction => {:product_id => products(:products_supplements_carbokick).id,
          :title => "new instruction", :body => "new instruction", :position => 99}
      end
      assert_not_nil flash[:notice]
      instruction = Instruction.find_by_title("new instruction")
      assert_redirected_to "/backoffice/products/products/instructions/edit?id=" + instruction.to_param
    end

    it "should get edit" do
      get :edit, :id => instructions(:carbokick_ingredients).to_param
      assert_response :success
    end

    it "should update instruction" do
      post :update, :id => instructions(:carbokick_ingredients).to_param,
        :instruction => {:title => "Instruction1"}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/products/products/instructions/edit?id=" + instructions(:carbokick_ingredients).to_param
    end

    it "should destroy instruction" do
      assert_difference('Instruction.count', -1) do
        delete :destroy, :id => instructions(:carbokick_ingredients).to_param
      end
      assert_redirected_to "/backoffice/products/products/instructions"
    end
  end
end
