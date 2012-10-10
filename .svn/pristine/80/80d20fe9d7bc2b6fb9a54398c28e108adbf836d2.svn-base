require 'spec_helper'

describe UserStatusFilter do
  context "creations" do
    it "should be created from hash" do
      @user_status_filter = UserStatusFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @user_status_filter.name
      assert_equal "super code", @user_status_filter.code
      assert_equal "super about", @user_status_filter.about
      assert_equal "2010-08-23 12:51:00 +0400", @user_status_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @user_status_filter.created_at_till.to_s
    end
  end
end
