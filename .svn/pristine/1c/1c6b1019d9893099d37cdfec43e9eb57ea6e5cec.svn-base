require 'spec_helper'

describe RequestFilter do
  context "creations" do
    it "should be created from hash" do
      @request_filter = RequestFilter.new(
        :titlel => "here is title",
        :product_id => products(:products_supplements_carbokick).id,
        :request_status_id => request_statuses(:active_request_status).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "here is title", @request_filter.titlel
      assert_equal products(:products_supplements_carbokick).id, @request_filter.product_id
      assert_equal request_statuses(:active_request_status).id, @request_filter.request_status_id
      assert_equal "2010-08-23 12:51:00 +0400", @request_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @request_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:product) }
    it { should belong_to(:request_status) }
  end
end
