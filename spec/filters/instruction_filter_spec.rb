require 'spec_helper'

describe InstructionFilter do
  context "creations" do
    it "should be created from hash" do
      @instruction_filter = InstructionFilter.new(
        :title => "instruction title",
        :body => "instruction body",
        :product_id => products(:products_supplements_carbokick).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "instruction title", @instruction_filter.title
      assert_equal "instruction body", @instruction_filter.body
      assert_equal products(:products_supplements_carbokick).id, @instruction_filter.product_id
      assert_equal "2010-08-23 12:51:00 +0400", @instruction_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @instruction_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:product) }
  end
end
