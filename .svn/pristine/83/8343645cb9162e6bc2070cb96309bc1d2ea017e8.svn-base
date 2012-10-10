require 'spec_helper'

describe ArticlesController do
  # ::Rails.logger.error("...")
  render_views

  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
end
