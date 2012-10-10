require 'spec_helper'

describe VariantFilter do
  context "creations" do
    it "should be created from hash" do
      @variant_filter = VariantFilter.new(
        :namel => "with banana taste",
        :product_id => products(:products_supplements_carbokick).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "with banana taste", @variant_filter.namel
      assert_equal products(:products_supplements_carbokick).id, @variant_filter.product_id
      assert_equal "2010-08-23 12:51:00 +0400", @variant_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @variant_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:product) }
  end
end
