require 'spec_helper'

describe ManpageFilter do
  context "creations" do
    it "should be created from hash" do
      @manpage_filter = ManpageFilter.new(
        :code => "super code", :namel => "super name",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super code", @manpage_filter.code
      assert_equal "super name", @manpage_filter.namel
      assert_equal "2010-08-23 12:51:00 +0400", @manpage_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @manpage_filter.created_at_till.to_s
    end
  end
end
