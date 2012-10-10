# == Schema Information
#
# Table name: product_type_properties
#
#  id              :integer(4)      not null, primary key
#  product_type_id :integer(4)      not null
#  property_id     :integer(4)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe ProductTypeProperty do
  context "validations" do
  end
end
