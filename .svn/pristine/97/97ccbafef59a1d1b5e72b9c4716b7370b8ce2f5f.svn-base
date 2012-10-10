require 'spec_helper'

describe Backoffice::Website::Contents::VacanciesController, :type=>:controller do
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
      assert_select "form#vacancies_filter"
    end

    it "should get index again" do
      get :index
      assert_response :success
    end

    it "should get index with filter" do
      get :index, :vacancy_filter => {:namel => "%",
          :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
      assert_response :success
    end


    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create vacancy" do
      assert_difference('Vacancy.count') do
        post :create, :vacancy => {:name => "vacancy at spb",
            :about => "vacancy at spb",
            :title => "courier", :body => "courier", :region_id => regions(:peterburg_region).id, :enabled => 1}
      end
      assert_not_nil flash[:notice]
      vacancy = Vacancy.find_by_name("vacancy at spb")
      assert_redirected_to "/backoffice/hrmanager/tasks/vacancies/edit?id=" + vacancy.to_param
    end

    it "should get edit" do
      get :edit, :id => vacancies(:courier_at_peterburg).to_param
      assert_response :success
    end

    it "should update vacancy" do
      post :update, :id => vacancies(:courier_at_peterburg).to_param, :vacancy => {
          :name => "vacancy at spb",
          :about => "vacancy at spb",
          :region_id => regions(:peterburg_region).id, :enabled => 1}
      assert_not_nil flash[:notice]
      assert_redirected_to "/backoffice/hrmanager/tasks/vacancies/edit?id=" + vacancies(:courier_at_peterburg).to_param
    end

    it "should destroy vacancy" do
      assert_difference('Vacancy.count', -1) do
        delete :destroy, :id => vacancies(:courier_at_peterburg).to_param
      end
      assert_redirected_to "/backoffice/hrmanager/tasks/vacancies"
    end
  end

end
