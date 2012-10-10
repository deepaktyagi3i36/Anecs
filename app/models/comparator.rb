# == Schema Information
#
# Table name: comparators
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  session_id :integer(4)
#  website_id :integer(4)      not null
#

class Comparator < ActiveRecord::Base
  # ::Rails.logger.error("...")

  belongs_to :website
  belongs_to :user
  belongs_to :session
  has_many :comparator_items, :dependent => :delete_all

  validates_uniqueness_of :user_id, :allow_nil => true
  validates_associated :comparator_items

  def add_comparator_item(comparator_item)
    item = comparator_items.find :first, :conditions => ["variant_id = ?", comparator_item.variant_id]
    if item.nil?
      ComparatorItem.create! :comparator_id => id, :variant_id => comparator_item.variant_id
    end
  end

  def comparator_items_attributes=(items_attributes)
    comparator_items.each do |comparator_item|
      attributes = items_attributes[comparator_item.id.to_s]
      if attributes
        attributes.delete 'id'
        if attributes.include? '_destroy'
          comparator_item.delete
        else
          raise "operation is not supported"
        end
      end
    end
  end

  def delete_comparator_items
    comparator_items.each do |comparator_item|
      comparator_item.delete
    end
  end

end
