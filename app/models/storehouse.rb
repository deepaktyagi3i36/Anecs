# == Schema Information
#
# Table name: storehouses
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  about      :string(128)     not null
#  region_id  :integer(4)      not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime
#  updated_at :datetime
#  website_id :integer(4)      not null
#

class Storehouse < ActiveRecord::Base
  # ::Rails.logger.error("...")
  # has_permalink :name, :update => true

  belongs_to :website
  belongs_to :region
  has_many :inventories, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :about
  validates_presence_of :region_id
  validates_presence_of :enabled

  validates_length_of :name, :within => 1..128
  validates_length_of :about, :within => 1..5000

  validates_uniqueness_of :name

end
