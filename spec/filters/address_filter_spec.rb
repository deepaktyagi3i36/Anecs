require 'spec_helper'

describe AddressFilter do
  context "creations" do
    it "should be created from hash" do
      @address_filter = AddressFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @address_filter.name.should == "super name"
      @address_filter.code.should == "super code"
      @address_filter.about.should == "super about"
      @address_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @address_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end
end


