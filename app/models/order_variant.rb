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

class OrderVariant < ActiveRecord::Base
  belongs_to :order
  belongs_to :variant
  belongs_to :currency
  
  has_many :order_variant_properties, :dependent => :destroy

end
