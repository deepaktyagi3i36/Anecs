require 'spec_helper'

describe DatatypeFilter do
  context "creations" do
    it "should be created from hash" do
      @datatype_filter = DatatypeFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @datatype_filter.name
      assert_equal "super code", @datatype_filter.code
      assert_equal "super about", @datatype_filter.about
      assert_equal "2010-08-23 12:51:00 +0400", @datatype_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @datatype_filter.created_at_till.to_s
    end
  end
end
