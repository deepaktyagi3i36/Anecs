require 'spec_helper'

describe VacancyFilter do
  context "creations" do
    it "should be created from hash" do
      @vacancy_filter = VacancyFilter.new(
        :namel => "super name",
        :region_id => regions(:peterburg_region).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      assert_equal "super name", @vacancy_filter.namel
      assert_equal regions(:peterburg_region).id, @vacancy_filter.region_id
      assert_equal "2010-08-23 12:51:00 +0400", @vacancy_filter.created_at_since.to_s
      assert_equal "2011-08-23 12:51:00 +0400", @vacancy_filter.created_at_till.to_s
    end
  end

  context "validations" do
    it { should belong_to(:region) }
  end

end

class VacancyFilterTest < ActiveSupport::TestCase

  test "vacancy fitler creation from hash" do
  end

end

