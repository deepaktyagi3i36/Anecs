require 'spec_helper'

describe LanguageFilter do
  context "creations" do
    it "should be created from hash" do
      @language_filter = LanguageFilter.new(
        :name => "super name", :code => "super code",:about => "super about", :locale => "ru",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @language_filter.name
      assert_equal "super code", @language_filter.code
      assert_equal "super about", @language_filter.about
      assert_equal "ru", @language_filter.locale
      assert_equal "2010-08-23 12:51:00 +0400", @language_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @language_filter.created_at_till.to_s
    end
  end
end
