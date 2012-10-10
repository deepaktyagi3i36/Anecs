require 'spec_helper'

describe Backoffice::Website::Contents::ManpagesController, :type=>:controller do
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
      assert_select "form#manpages_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :manpage_filter => {:code => "%", :namel => "%",
          :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create manpage" do
      assert_difference('Manpage.count') do
        post :create, :manpage => {:name => "welcome1", :code => "welcome1", :content => nil,
            :pagetitle => "welcome1", :metakeywords => "welcome1", :metadescription => "welcome1",
            :parent_id => nil, :enabled => 1}
      end
      assert_not_nil flash[:notice]
      manpage = Manpage.find_by_code("welcome1")
      assert_redirected_to "/backoffice/moderator/contents/manpages/edit?id=" + manpage.to_param
    end

    it "should get edit" do
      get :edit, :id => manpages(:welcome_manpage).to_param
      assert_response :success
    end

    it "should update manpage" do
      post :update, :id => manpages(:welcome_manpage).to_param, :manpage => {
          :name => "welcome1", :code => "welcome1", :content => nil,
          :pagetitle => "welcome1", :metakeywords => "welcome1", :metadescription => "welcome1",
          :parent_id => nil, :enabled => 1}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/moderator/contents/manpages/edit?id=" + manpages(:welcome_manpage).to_param
    end

    it "should destroy manpage" do
      assert_difference('Manpage.count', -1) do
        delete :destroy, :id => manpages(:welcome_child_manpage).to_param
      end
      assert_redirected_to "/backoffice/moderator/contents/manpages"
    end
  end
end
