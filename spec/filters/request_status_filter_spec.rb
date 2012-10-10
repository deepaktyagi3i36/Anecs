require 'spec_helper'

describe RequestStatusFilter do
  context "creations" do
    it "should be created from hash" do
      @request_status_filter = RequestStatusFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @request_status_filter.name
      assert_equal "super code", @request_status_filter.code
      assert_equal "super about", @request_status_filter.about
      assert_equal "2010-08-23 12:51:00 +0400", @request_status_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @request_status_filter.created_at_till.to_s
    end
  end
end
