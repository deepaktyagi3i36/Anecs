# == Schema Information
#
# Table name: patterns
#
#  id              :integer(4)      not null, primary key
#  pattern_type_id :integer(4)      not null
#  name            :string(128)     not null
#  title           :string(255)     not null
#  body            :string(4000)    not null
#  created_at      :datetime
#  updated_at      :datetime
#  website_id      :integer(4)      not null
#

class Pattern < ActiveRecord::Base
  belongs_to :website
  belongs_to :pattern_type
  has_many :instructions

  validates_presence_of :pattern_type_id
  validates_presence_of :name
  validates_presence_of :title
  validates_presence_of :body

  validates_length_of :name, :within => 1..256
  validates_length_of :title, :within => 1..256
  validates_length_of :body, :within => 1..4000

  validates_uniqueness_of :name
end
