require 'spec_helper'

describe FeedbacksController do
  # ::Rails.logger.error("...")
  render_views

  # Activate authlogic
  setup :activate_authlogic

  # Replace this with your real tests.
  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create feedback" do
    assert_difference('Feedback.count') do
      post :create, :feedback => { :user_id => users(:quentin).id,
        :contact_type_id => contact_types(:order_contact_type).id,
        :contact_status_id => contact_statuses(:active_contact_status).id,
        :title => "courier", :body => "courier",}
    end
    assert_not_nil flash[:notice]
    feedback = Feedback.find_by_title("courier")
    assert_redirected_to root_path
  end

end
