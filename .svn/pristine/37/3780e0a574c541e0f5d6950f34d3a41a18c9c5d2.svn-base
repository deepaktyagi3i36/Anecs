# == Schema Information
#
# Table name: contacts
#
#  id         :integer(4)      not null, primary key
#  product_id :integer(4)      not null
#  name       :string(64)      not null
#  about      :string(256)     not null
#  latitude   :decimal(9, 6)   not null
#  longitude  :decimal(9, 6)   not null
#  zoom       :integer(4)      not null
#  title      :string(64)      not null
#  body       :string(256)     not null
#  created_at :datetime
#  updated_at :datetime
#

# = Entity description
#
# Contact is an entity that describe contact product inforation. If product is an center then product
# has location on the map, working time and contract information. There table contains it.
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect
#
#
class Contact < ActiveRecord::Base
  belongs_to :product
end
