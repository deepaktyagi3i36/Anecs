require 'spec_helper'

describe Backoffice::Website::Contents::ArticlesController, :type=>:controller do
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
      assert_select "form#articles_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :article_filter => { :code => "%", :namel => "%",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create article" do
      assert_difference('Article.count') do
        post :create, :article => { :article_type_id => article_types(:information_article_type).id,
          :name => "supplement1",
          :code => "supplement1", :annotation => nil, :content => nil,
          :pagetitle => "supplement1", :metakeywords => "supplement1", :metadescription => "metakeywords",
          :parent_id => nil, :enabled => 1}
      end
      assert_not_nil flash[:notice]
      article = Article.find_by_code("supplement1")
      assert_redirected_to "/backoffice/moderator/contents/articles/edit?id=" + article.to_param
    end

    it "should get edit" do
      get :edit, :id => articles(:supplement_article).to_param
      assert_response :success
    end

    it "should update article" do
      post :update, :id => articles(:supplement_article).to_param, :article => {
          :article_type_id => article_types(:information_article_type).id,
          :name => "supplement1", :code => "supplement1", :annotation => nil, :content => nil,
          :pagetitle => "supplement1", :metakeywords => "supplement1", :metadescription => "supplement1",
          :parent_id => nil, :enabled => 1}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/moderator/contents/articles/edit?id=" + articles(:supplement_article).to_param
    end

    it "should destroy article with childs" do
      assert_difference('Article.count', -3) do
        delete :destroy, :id => articles(:supplement_article).to_param
      end
      assert_redirected_to "/backoffice/moderator/contents/articles"
    end

    it "should destroy article" do
      assert_difference('Article.count', -1) do
        delete :destroy, :id => articles(:nofk_article).to_param
      end
      assert_redirected_to "/backoffice/moderator/contents/articles"
    end
  end
end
