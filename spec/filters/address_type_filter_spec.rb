require 'spec_helper'

describe AddressTypeFilter do
  context "creations" do
    it "should be created from hash" do
      @address_type_filter = AddressTypeFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @address_type_filter.name.should == "super name"
      @address_type_filter.code.should == "super code"
      @address_type_filter.about.should == "super about"
      @address_type_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @address_type_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end
end
