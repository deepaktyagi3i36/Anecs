# == Schema Information
#
# Table name: comparator_items
#
#  id            :integer(4)      not null, primary key
#  comparator_id :integer(4)      not null
#  variant_id    :integer(4)      not null
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe ComparatorItem do
  context "validations" do
    it { should belong_to(:variant) }
    it { should belong_to(:comparator) }

    it { should validate_uniqueness_of(:variant_id).scoped_to(:comparator_id) }
    it { should validate_uniqueness_of(:comparator_id).scoped_to(:variant_id) }

    it { should validate_presence_of(:variant) }
    it { should validate_presence_of(:comparator) }

  end
end
