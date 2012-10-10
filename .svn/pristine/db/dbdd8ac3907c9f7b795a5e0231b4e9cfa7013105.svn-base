require 'spec_helper'

describe PatternFilter do
  context "creations" do
    it "should be created from hash" do
      @pattern_filter = PatternFilter.new(
        :pattern_type_id => pattern_types(:instructions_pattern_type).id,
        :name => "pattern name",
        :title => "pattern title",
        :body => "pattern body",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal pattern_types(:instructions_pattern_type).id, @pattern_filter.pattern_type_id
      assert_equal "pattern name", @pattern_filter.name
      assert_equal "pattern title", @pattern_filter.title
      assert_equal "pattern body", @pattern_filter.body
      assert_equal "2010-08-23 12:51:00 +0400", @pattern_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @pattern_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:pattern_type) }
  end
end
