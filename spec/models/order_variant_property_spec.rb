# == Schema Information
#
# Table name: order_variant_properties
#
#  id               :integer(4)      not null, primary key
#  order_variant_id :integer(4)      not null
#  property_nm      :string(255)     not null
#  value            :string(255)     not null
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe OrderVariantProperty do
  context "validations" do
  end
end
