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

class ProductTypeProperty < ActiveRecord::Base
  belongs_to :property
  belongs_to :product_type

  validates_presence_of :property_id
  validates_presence_of :product_type_id

  validates_uniqueness_of :property_id, :scope => :product_type_id
  validates_uniqueness_of :product_type_id, :scope => :property_id
end
