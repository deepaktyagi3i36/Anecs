# == Schema Information
#
# Table name: invalid_routes
#
#  id         :integer(4)      not null, primary key
#  priority   :integer(4)      not null
#  pattern    :string(128)     not null
#  enabled    :integer(4)      default(1), not null
#  created_at :datetime
#  updated_at :datetime
#

class InvalidRoute < ActiveRecord::Base
  # ::Rails.logger.error("...")

  validates_presence_of :priority
  validates_presence_of :pattern
  validates_presence_of :enabled

  validates_length_of :pattern, :within => 1..128

  validates_uniqueness_of :pattern

end
