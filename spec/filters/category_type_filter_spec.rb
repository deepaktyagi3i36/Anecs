require 'spec_helper'

describe CategoryTypeFilter do
  context "creations" do
    it "should be created from hash" do
      @category_type_filter = CategoryTypeFilter.new(
        :name => "super name", :code => "super code", :about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @category_type_filter.name.should == "super name"
      @category_type_filter.code.should == "super code"
      @category_type_filter.about.should == "super about"
      @category_type_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @category_type_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end
end
