# == Schema Information
#
# Table name: links
#
#  id                :integer(4)      not null, primary key
#  product_id        :integer(4)      not null
#  expert_product_id :integer(4)      not null
#  created_at        :datetime
#  updated_at        :datetime
#

# = Entity description
#
# Link is en entity that connect product. There are expert and centers as product. This table bind this and
# answer on the question where (or what center) this expert is working.
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect
#
#
class Link < ActiveRecord::Base
  belongs_to :product
  belongs_to :linked_product, :class_name => "Product"
end
