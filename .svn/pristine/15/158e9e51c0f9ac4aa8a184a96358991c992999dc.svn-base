# == Schema Information
#
# Table name: instructions
#
#  id         :integer(4)      not null, primary key
#  product_id :integer(4)      not null
#  pattern_id :integer(4)
#  title      :string(256)     not null
#  body       :string(16384)   not null
#  created_at :datetime
#  updated_at :datetime
#  position   :integer(4)      not null
#

# = Entity description
#
# Photo is en entity that store instruction how to use product. For example if product is product such as
# supplement, there are instruction how to apply it. This table contains such instructions.
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect
#
#
class Instruction < ActiveRecord::Base
  # ::Rails.logger.error("...")

  belongs_to :product
  belongs_to :pattern

  validates_presence_of :product_id
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :position

  validates_length_of :title, :within => 1..256
  validates_length_of :body, :within => 1..16384
  validates_numericality_of :position, :only_integer => true, :greater_than_or_equal_to => 1
end
