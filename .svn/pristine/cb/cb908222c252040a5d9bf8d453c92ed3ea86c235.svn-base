# == Schema Information
#
# Table name: addresses
#
#  id              :integer(4)      not null, primary key
#  name            :string(128)     not null
#  address_type_id :integer(4)
#  user_id         :integer(4)
#  full_name       :string(1024)    not null
#  phone           :string(32)      not null
#  extra_phone     :string(32)
#  street_address1 :string(128)     not null
#  street_address2 :string(128)
#  city            :string(128)     not null
#  country_id      :integer(4)      not null
#  zip             :string(16)
#  created_at      :datetime
#  updated_at      :datetime
#  default         :integer(4)      default(0), not null
#

require 'spec_helper'

describe Address do
  context "validations" do
    #it { should belong_to(:product) }
    it { should belong_to(:address_type) }
    it { should belong_to(:user) }
    it { should belong_to(:country) }
    it { should have_many(:orders) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address_type)}
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:street_address1) }


    # TODO: fix this code after portint from tests to specs
    #['+1(111)111-11-11', '8(812)2222222', '8-812-0000000', '+79211234567',
    #    '123-44-55', '1234567', '107 (495) 2124380'].each do |good_phone|
    #  should allow_value(good_phone).for(:phone)
    #  should allow_value(good_phone).for(:extra_phone)
    #end
    #should allow_value('').for(:extra_phone)
    #
    #['\1', '%20%43', '+7_911_2324323', '*', 'adf', '78&25', '\n\r', '<8>23342343'].each do |bad_phone|
    #  should_not allow_value(bad_phone).for(:phone)
    #  should_not allow_value(bad_phone).for(:extra_phone)
    #end
    #should_not allow_value('').for(:phone)
    #
    #should allow_value(0).for(:default)
    #should allow_value(1).for(:default)
    #[-1, 2, 8888, 0.4, 'zero', 'one', '', '#'].each {|bad_value| should_not allow_value(bad_value).for(:default)}

    #it 'shouldnt delete address that presents in non-completed order' do
    #  non_completed_order = Order.first :include => :order_state, :conditions => "address_id is not null
    #      and order_states.code != 'completed'"
    #  assert_equal(false, non_completed_order.address.destroy)
    #end

    #it 'should delete address that doesnt present in non-completed order' do
    #  address = Address.first :conditions => "not exists(
    #      select 1 from orders, order_states
    #      where orders.address_id = addresses.id
    #      and orders.order_state_id = order_states.id
    #      and order_states.code != 'completed'
    #  )"
    #  assert_difference('Address.count', -1) do
    #    address.destroy
    #  end
    #end
  end
end
