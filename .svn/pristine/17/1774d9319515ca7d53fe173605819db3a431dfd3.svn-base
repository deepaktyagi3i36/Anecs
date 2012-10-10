require 'spec_helper'

describe ComplaintTypeFilter do
  context "creations" do
    it "should be created from hash" do
      @complaint_type_filter = ComplaintTypeFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @complaint_type_filter.name.should == "super name"
      @complaint_type_filter.code.should == "super code"
      @complaint_type_filter.about.should == "super about"
      @complaint_type_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @complaint_type_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end
end
