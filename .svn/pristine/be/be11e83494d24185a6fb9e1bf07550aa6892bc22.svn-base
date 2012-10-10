require 'spec_helper'

describe PromotionFilter do
  context "creations" do
    it "should be created from hash" do
      @promotion_filter = PromotionFilter.new(
        :promotion_type_id => promotion_types(:action_promotion_type).id,
        :name => "promotion name",
        :title => "promotion title",
        :body => "promotion body",
        :begin_dt => "2010-08-23 12:51", :finish_dt => "2011-08-23 12:51",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal promotion_types(:action_promotion_type).id, @promotion_filter.promotion_type_id
      assert_equal "promotion name", @promotion_filter.name
      assert_equal "promotion title", @promotion_filter.title
      assert_equal "promotion body", @promotion_filter.body
      assert_equal "2010-08-23 12:51:00 +0400", @promotion_filter.begin_dt.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @promotion_filter.finish_dt.to_s
      assert_equal "2010-08-23 12:51:00 +0400", @promotion_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @promotion_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:promotion_type) }
  end
end

