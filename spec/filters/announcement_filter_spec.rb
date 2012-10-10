require 'spec_helper'

describe AnnouncementFilter do
  context "creations" do
    it "should be created from hash" do
      @announcement_filter = AnnouncementFilter.new(
        :titlel => "super title",
        :product_id => products(:products_supplements_carbokick).id,
        :announcement_status_id => announcement_statuses(:created_announcement_status).id,
        :user_id => users(:quentin).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @announcement_filter.titlel.should == "super title"
      @announcement_filter.product_id.should == products(:products_supplements_carbokick).id
      @announcement_filter.announcement_status_id.should == announcement_statuses(:created_announcement_status).id
      @announcement_filter.user_id.should == users(:quentin).id
      @announcement_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @announcement_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end

  context "validations" do
    it { should belong_to(:product) }
    it { should belong_to(:announcement_status) }
    it { should belong_to(:user) }
  end
end
