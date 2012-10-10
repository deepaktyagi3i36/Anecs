# == Schema Information
#
# Table name: order_variants
#
#  id          :integer(4)      not null, primary key
#  order_id    :integer(4)      not null
#  variant_id  :integer(4)      not null
#  product_nm  :string(128)     not null
#  variant_nm  :string(128)     not null
#  quantity    :integer(4)      not null
#  price       :decimal(10, 2)  default(0.0), not null
#  currency_id :integer(4)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe OrderVariant do
  context "validations" do
    it { should belong_to(:order) }
    it { should belong_to(:variant) }
    it { should belong_to(:currency) }
  end
end
