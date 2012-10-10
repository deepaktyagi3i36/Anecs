require 'spec_helper'

describe ManpagesController do
  # ::Rails.logger.error("...")
  render_views

  # Activate authlogic
  setup :activate_authlogic

  # Replace this with your real tests.
  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end
  
end
