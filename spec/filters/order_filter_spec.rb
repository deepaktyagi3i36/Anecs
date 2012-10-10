require 'spec_helper'

describe OrderFilter do
  context "creations" do
    it "should be created from hash" do
      @order_filter = OrderFilter.new(
        :namel => "super name",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @order_filter.namel
      assert_equal "2010-08-23 12:51:00 +0400", @order_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @order_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:order_state) }
    it { should belong_to(:user) }
    it { should belong_to(:shipping_type) }
    it { should belong_to(:payment_type) }
    it { should belong_to(:address) }
    it { should belong_to(:checkout_state) }
  end
end
