require 'spec_helper'

describe RuntimeSettingFilter do
  context "creations" do
    it "should be created from hash" do
      @runtime_setting_filter = RuntimeSettingFilter.new(
        :name => "super name", :code => "super code",:about => "super about", :value => "ru",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @runtime_setting_filter.name
      assert_equal "super code", @runtime_setting_filter.code
      assert_equal "super about", @runtime_setting_filter.about
      assert_equal "ru", @runtime_setting_filter.value
      assert_equal "2010-08-23 12:51:00 +0400", @runtime_setting_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @runtime_setting_filter.created_at_till.to_s
    end
  end
end
