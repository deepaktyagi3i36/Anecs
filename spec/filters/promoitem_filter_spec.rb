require 'spec_helper'

describe PromoitemFilter do
  context "creations" do
    it "should be created from hash" do
      @promoitem_filter = PromoitemFilter.new(
        :promotion_id => promotions(:feburary23_action).id,
        :product_id => products(:products_supplements_carbokick).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal promotions(:feburary23_action).id, @promoitem_filter.promotion_id
      assert_equal products(:products_supplements_carbokick).id, @promoitem_filter.product_id
      assert_equal "2010-08-23 12:51:00 +0400", @promoitem_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @promoitem_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:promotion) }
    it { should belong_to(:product) }
  end
end
