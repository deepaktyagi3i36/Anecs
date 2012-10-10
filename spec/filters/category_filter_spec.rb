require 'spec_helper'

describe CategoryFilter do
  context "creations" do
    it "should be created from hash" do
      @category_filter = CategoryFilter.new(
        :namel => "super name", :about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @category_filter.namel.should == "super name"
      @category_filter.about.should == "super about"
      @category_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @category_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end
end
