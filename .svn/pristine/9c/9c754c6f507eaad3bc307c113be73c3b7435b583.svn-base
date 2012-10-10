# == Schema Information
#
# Table name: pattern_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  created_at :datetime
#  updated_at :datetime
#

class PatternType < ActiveRecord::Base
  has_many :patterns

  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :about

  validates_length_of :name, :within => 1..128
  validates_length_of :code, :within => 1..128
  validates_length_of :about, :within => 1..128

  validates_uniqueness_of :name
  validates_uniqueness_of :code

end
