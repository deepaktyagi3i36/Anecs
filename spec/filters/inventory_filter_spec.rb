require 'spec_helper'

describe InventoryFilter do
  context "creations" do
    it "should be created from hash" do
      @inventory_filter = InventoryFilter.new(
        :product_id => products(:products_supplements_carbokick).id,
        :variant_id => variants(:carbokick_with_banana_taste).id,
        :storehouse_id => storehouses(:peterburg_storehouse).id,
        :quantity_since => 10, :quantity_till => 20,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal products(:products_supplements_carbokick).id, @inventory_filter.product_id
      assert_equal variants(:carbokick_with_banana_taste).id, @inventory_filter.variant_id
      assert_equal storehouses(:peterburg_storehouse).id, @inventory_filter.storehouse_id
      assert_equal 10, @inventory_filter.quantity_since
      assert_equal 20, @inventory_filter.quantity_till
      assert_equal "2010-08-23 12:51:00 +0400", @inventory_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @inventory_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:product) }
    it { should belong_to(:variant) }
    it { should belong_to(:storehouse) }
  end
end
