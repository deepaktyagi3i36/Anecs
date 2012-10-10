# == Schema Information
#
# Table name: inventories
#
#  id            :integer(4)      not null, primary key
#  storehouse_id :integer(4)      not null
#  variant_id    :integer(4)      not null
#  quantity      :integer(4)      default(0), not null
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Inventory do
  context "validations" do
    it { should belong_to(:storehouse) }
    it { should belong_to(:variant) }

    it { should validate_presence_of(:storehouse_id) }
    it { should validate_presence_of(:variant_id) }

    it { should validate_uniqueness_of(:storehouse_id).scoped_to(:variant_id) }
    it { should validate_uniqueness_of(:variant_id).scoped_to(:storehouse_id) }

  end
end

