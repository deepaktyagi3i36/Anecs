# == Schema Information
#
# Table name: inventories
#
#  id            :integer(4)      not null, primary key
#  storehouse_id :integer(4)      not null
#  variant_id    :integer(4)      not null
#  quantity      :integer(4)      default(0), not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Inventory < ActiveRecord::Base
  belongs_to :storehouse
  belongs_to :variant

  validates_presence_of :storehouse_id
  validates_presence_of :variant_id
  validates_uniqueness_of :storehouse_id, :scope => :variant_id
  validates_uniqueness_of :variant_id, :scope => :storehouse_id
end
