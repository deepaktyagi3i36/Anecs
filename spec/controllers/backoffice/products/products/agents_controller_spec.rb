require 'spec_helper'

describe Backoffice::Products::Products::AgentsController, :type=>:controller do
  render_views

  # Activate authlogic
  setup :activate_authlogic

  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  it 'should inherit from BackofficeController' do
    assert_kind_of BackofficeController, @controller
  end

  it "should get index" do
    get :index
    assert_response :success
    assert_select "form#agents_filter"
  end

  it "should get index again" do
    get :index
    assert_response :success
  end
  
  it "should get index with filter" do
    get :index, :agent_filter => { :name => "%",
      :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51"}
    assert_response :success
  end
  
end
