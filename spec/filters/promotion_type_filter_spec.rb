require 'spec_helper'

describe PromotionTypeFilter do
  context "creations" do
    it "should be created from hash" do
      @promotion_type_filter = PromotionTypeFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @promotion_type_filter.name
      assert_equal "super code", @promotion_type_filter.code
      assert_equal "super about", @promotion_type_filter.about
      assert_equal "2010-08-23 12:51:00 +0400", @promotion_type_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @promotion_type_filter.created_at_till.to_s
    end
  end
end
