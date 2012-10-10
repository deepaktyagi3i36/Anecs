# == Schema Information
#
# Table name: orders
#
#  id                :integer(4)      not null, primary key
#  name              :string(128)     not null
#  namel             :string(128)     not null
#  about             :string(128)
#  order_state_id    :integer(4)      not null
#  user_id           :integer(4)
#  shipping_type_id  :integer(4)
#  payment_type_id   :integer(4)
#  address_id        :integer(4)
#  checkout_state_id :integer(4)      not null
#  email             :string(128)
#  created_at        :datetime
#  updated_at        :datetime
#  session_id        :integer(4)
#  user_name         :string(255)
#  notes             :string(255)
#  total_price       :decimal(10, 2)  not null
#  total_items       :integer(4)      not null
#  shipping_address  :string(1024)
#  website_id        :integer(4)      not null
#  region_id         :integer(4)      not null
#

require 'spec_helper'

describe Order do
  context "validations" do
    it { should belong_to(:address) }
    it { should belong_to(:order_state) }
    it { should belong_to(:shipping_type) }
    it { should belong_to(:payment_type) }
    it { should belong_to(:user) }
    it { should belong_to(:checkout_state) }

  end
end
