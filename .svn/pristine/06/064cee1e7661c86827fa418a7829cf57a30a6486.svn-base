require 'spec_helper'

describe CallmebacksController do
  # ::Rails.logger.error("...")
  render_views

  before(:each) do
    # Set current default_website_id to wellness website
    default_website_id = RuntimeSetting.find_by_code("default_website_id")
    default_website_id.update_attributes!(:value => websites(:wellness_website).id)
  end

  # Replace this with your real tests.
  it "should inherit from ApplicationController" do
    assert_kind_of ApplicationController, @controller
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create callmeback" do
    assert_difference('Callmeback.count') do
      post :create, :callmeback => { :user_id => users(:quentin).id,
        :contact_type_id => contact_types(:order_contact_type).id,
        :contact_status_id => contact_statuses(:active_contact_status).id,
        :phone => "1234", :title => "courier", :body => "courier",}
    end
    assert_not_nil flash[:notice]
    callmeback = Callmeback.find_by_title("courier")
    assert_redirected_to root_path
  end

end
