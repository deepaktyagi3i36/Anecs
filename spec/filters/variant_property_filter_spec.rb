require 'spec_helper'

describe VariantPropertyFilter do
  context "creations" do
    it "should be created from hash" do
      @variant_property_filter = VariantPropertyFilter.new(
        :property_id => properties(:quantity_property).id,
        :variant_id => variants(:carbokick_with_banana_taste).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal properties(:quantity_property).id, @variant_property_filter.property_id
      assert_equal variants(:carbokick_with_banana_taste).id, @variant_property_filter.variant_id
      assert_equal "2010-08-23 12:51:00 +0400", @variant_property_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @variant_property_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:property) }
    it { should belong_to(:variant) }
  end
end
