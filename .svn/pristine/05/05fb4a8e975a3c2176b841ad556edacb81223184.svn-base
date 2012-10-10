require 'spec_helper'

describe ThemeFilter do
  context "creations" do
    it "should be created from hash" do
      @website_filter = WebsiteFilter.new(
        :name => "super name", :code => "super code",:about => "super about", :locale => "ru",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @website_filter.name
      assert_equal "super code", @website_filter.code
      assert_equal "super about", @website_filter.about
      assert_equal "2010-08-23 12:51:00 +0400", @website_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @website_filter.created_at_till.to_s
    end
  end
end
