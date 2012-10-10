require 'spec_helper'

describe ShippingTypeFilter do
  context "creations" do
    it "should be created from hash" do
      @shipping_type_filter = ShippingTypeFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @shipping_type_filter.name
      assert_equal "super code", @shipping_type_filter.code
      assert_equal "super about", @shipping_type_filter.about
      assert_equal "2010-08-23 12:51:00 +0400", @shipping_type_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @shipping_type_filter.created_at_till.to_s
    end
  end
end
