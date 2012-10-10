# == Schema Information
#
# Table name: comparator_items
#
#  id            :integer(4)      not null, primary key
#  comparator_id :integer(4)      not null
#  variant_id    :integer(4)      not null
#  created_at    :datetime
#  updated_at    :datetime
#

class ComparatorItem < ActiveRecord::Base
  # ::Rails.logger.error("...")
  belongs_to :comparator
  belongs_to :variant

  validates_presence_of :comparator
  validates_presence_of :variant

  validates_uniqueness_of :variant_id, :scope => [:comparator_id]
  validates_uniqueness_of :comparator_id, :scope => [:variant_id]


end
