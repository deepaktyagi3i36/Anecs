require 'spec_helper'

describe AnnouncementStatusFilter do
  context "creations" do
    it "should be created from hash" do
      @announcement_status_filter = AnnouncementStatusFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @announcement_status_filter.name.should == "super name"
      @announcement_status_filter.code.should == "super code"
      @announcement_status_filter.about.should == "super about"
      @announcement_status_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @announcement_status_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end
end
