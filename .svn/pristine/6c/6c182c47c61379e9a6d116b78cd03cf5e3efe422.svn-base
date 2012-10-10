require 'spec_helper'

describe ConnectionFilter do
  context "creations" do
    it "should be created from hash" do
      @connection_filter = ConnectionFilter.new(
        :category_id => categories(:products_supplements_bycategory_anabolic_category).id,
        :product_id => products(:products_supplements_carbokick).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @connection_filter.category_id.should == categories(:products_supplements_bycategory_anabolic_category).id
      @connection_filter.product_id.should == products(:products_supplements_carbokick).id
      @connection_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @connection_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end

  context "validations" do
    it { should belong_to(:category) }
    it { should belong_to(:product) }
  end

end
