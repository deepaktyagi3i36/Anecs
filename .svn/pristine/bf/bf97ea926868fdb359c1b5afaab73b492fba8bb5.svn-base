require 'spec_helper'

describe PropertyFilter do
  context "creations" do
    it "should be created from hash" do
      @property_filter = PropertyFilter.new(
        :name => "super name", :code => "super code", :about => "super about",
        :datatype_id => datatypes(:integer_datatype).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @property_filter.name
      assert_equal "super code", @property_filter.code
      assert_equal "super about", @property_filter.about
      assert_equal datatypes(:integer_datatype).id, @property_filter.datatype_id
      assert_equal "2010-08-23 12:51:00 +0400", @property_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @property_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:datatype) }
  end
end
