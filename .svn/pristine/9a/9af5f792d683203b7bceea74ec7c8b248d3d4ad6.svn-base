require 'spec_helper'

describe StateFilter do
  context "creations" do
    it "should be created from hash" do
      @state_filter = StateFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @state_filter.name
      assert_equal "super code", @state_filter.code
      assert_equal "super about", @state_filter.about
      assert_equal "2010-08-23 12:51:00 +0400", @state_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @state_filter.created_at_till.to_s
    end
  end
end
