# == Schema Information
#
# Table name: variant_properties
#
#  id          :integer(4)      not null, primary key
#  variant_id  :integer(4)      not null
#  property_id :integer(4)      not null
#  value       :string(255)     not null
#  created_at  :datetime
#  updated_at  :datetime
#

class VariantProperty < ActiveRecord::Base
  belongs_to :variant
  belongs_to :property

  validates_presence_of :variant_id
  validates_presence_of :property_id
  validates_presence_of :value

  validates_length_of :value, :within => 1..128
end
