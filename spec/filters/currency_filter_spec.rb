require 'spec_helper'

describe CurrencyFilter do
  context "creations" do
    it "should be created from hash" do
      @currency_filter = CurrencyFilter.new(
        :name => "super name", :code => "super code",:about => "super about", :sign => "$",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @currency_filter.name
      assert_equal "super code", @currency_filter.code
      assert_equal "super about", @currency_filter.about
      assert_equal "$", @currency_filter.sign
      assert_equal "2010-08-23 12:51:00 +0400", @currency_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @currency_filter.created_at_till.to_s
    end
  end
end

