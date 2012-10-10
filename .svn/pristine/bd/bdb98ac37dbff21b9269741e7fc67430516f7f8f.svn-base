# == Schema Information
#
# Table name: cart_items
#
#  id               :integer(4)      not null, primary key
#  shopping_cart_id :integer(4)      not null
#  variant_id       :integer(4)      not null
#  quantity         :integer(4)      not null
#  saved_for_later  :integer(4)      default(0), not null
#  created_at       :datetime
#  updated_at       :datetime
#

# TODO: think about class, is it necessary, do like buy_later_item & compare_item
class CartItem < ActiveRecord::Base
  # ::Rails.logger.error("...")
  belongs_to :shopping_cart
  belongs_to :variant

  validates_presence_of :shopping_cart
  validates_presence_of :variant
  validates_presence_of :saved_for_later

  validates_uniqueness_of :variant_id, :scope => [:shopping_cart_id, :saved_for_later]
  validates_uniqueness_of :shopping_cart_id, :scope => [:variant_id, :saved_for_later]
  validates_uniqueness_of :saved_for_later, :scope => [:variant_id, :shopping_cart_id]

  validates_numericality_of :quantity, :only_integer => true,
      :allow_nil => false, :greater_than => 0
  validates_numericality_of :saved_for_later, :only_integer => true,
      :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1,
      :allow_nil => false

end
