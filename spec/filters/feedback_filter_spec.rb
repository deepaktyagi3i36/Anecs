require 'spec_helper'

describe FeedbackFilter do
  context "creations" do
    it "should be created from hash" do
      @feedback_filter = FeedbackFilter.new(
        :user_id => users(:quentin).id,
        :contact_type_id => contact_types(:order_contact_type).id,
        :contact_status_id => contact_statuses(:active_contact_status).id,
        :title => "feedback title",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal users(:quentin).id, @feedback_filter.user_id
      assert_equal contact_types(:order_contact_type).id, @feedback_filter.contact_type_id
      assert_equal contact_statuses(:active_contact_status).id, @feedback_filter.contact_status_id
      assert_equal "feedback title", @feedback_filter.title
      assert_equal "2010-08-23 12:51:00 +0400", @feedback_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @feedback_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:user) }
    it { should belong_to(:contact_type) }
    it { should belong_to(:contact_status) }
  end
end

