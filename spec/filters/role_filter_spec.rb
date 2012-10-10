require 'spec_helper'

describe RoleFilter do
  context "creations" do
    it "should be created from hash" do
      @role_filter = RoleFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @role_filter.name
      assert_equal "super code", @role_filter.code
      assert_equal "super about", @role_filter.about
      assert_equal "2010-08-23 12:51:00 +0400", @role_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @role_filter.created_at_till.to_s
    end
  end
end
