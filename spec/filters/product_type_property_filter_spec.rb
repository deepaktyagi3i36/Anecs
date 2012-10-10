require 'spec_helper'

describe ProductTypePropertyFilter do
  context "creations" do
    it "should be created from hash" do
      @product_type_property_filter = ProductTypePropertyFilter.new(
        :property_id => properties(:quantity_property).id,
        :product_type_id => product_types(:supplement_products_type).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal properties(:quantity_property).id, @product_type_property_filter.property_id
      assert_equal product_types(:supplement_products_type).id, @product_type_property_filter.product_type_id
      assert_equal "2010-08-23 12:51:00 +0400", @product_type_property_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @product_type_property_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:property) }
    it { should belong_to(:product_type) }
  end
end
