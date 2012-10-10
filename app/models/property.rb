# == Schema Information
#
# Table name: properties
#
#  id          :integer(4)      not null, primary key
#  name        :string(128)     not null
#  code        :string(128)     not null
#  about       :string(128)     not null
#  datatype_id :integer(4)      not null
#  created_at  :datetime
#  updated_at  :datetime
#  website_id  :integer(4)      default(0), not null
#

class Property < ActiveRecord::Base
  belongs_to :website
  belongs_to :datatype
  has_many :variant_properties, :dependent => :destroy
  has_many :product_type_properties, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :about
  validates_presence_of :datatype_id

  validates_length_of :name, :within => 1..128
  validates_length_of :code, :within => 1..128
  validates_length_of :about, :within => 1..128

  validates_uniqueness_of :website_id, :scope => [:name]
  validates_uniqueness_of :name, :scope => [:website_id]

  validates_uniqueness_of :website_id, :scope => [:code]
  validates_uniqueness_of :code, :scope => [:website_id]
end
