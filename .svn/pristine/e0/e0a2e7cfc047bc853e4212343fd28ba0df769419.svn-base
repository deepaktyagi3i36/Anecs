# == Schema Information
#
# Table name: variants
#
#  id          :integer(4)      not null, primary key
#  product_id  :integer(4)      not null
#  name        :string(128)     not null
#  namel       :string(128)     not null
#  price       :decimal(10, 2)  default(0.0), not null
#  currency_id :integer(4)      not null
#  enabled     :integer(4)      default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Variant do
  context "validations" do
    it { should belong_to(:product) }
    it { should belong_to(:currency) }
    it { should have_many(:variant_properties) }
    it { should have_many(:cart_items) }
    it { should have_many(:inventories) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:enabled) }

    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }

  end
end

