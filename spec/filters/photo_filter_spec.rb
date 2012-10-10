require 'spec_helper'

describe PhotoFilter do
  context "creations" do
    it "should be created from hash" do
      @photo_filter = PhotoFilter.new(
        :product_id => products(:products_supplements_carbokick).id,
        :photo_file_name => "super_photo_file_name",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal products(:products_supplements_carbokick).id, @photo_filter.product_id
      assert_equal "super_photo_file_name", @photo_filter.photo_file_name
      assert_equal "2010-08-23 12:51:00 +0400", @photo_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @photo_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:product) }
  end
end

