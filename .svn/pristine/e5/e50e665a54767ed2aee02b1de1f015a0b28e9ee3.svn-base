require 'spec_helper'

describe OrderVariantFilter do
  context "creations" do
    it "should be created from hash" do
      @order_variant_filter = OrderVariantFilter.new(
        :order_id => orders(:quentin_order).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal orders(:quentin_order).id, @order_variant_filter.order_id
      assert_equal "2010-08-23 12:51:00 +0400", @order_variant_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @order_variant_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:order) }
  end
end
