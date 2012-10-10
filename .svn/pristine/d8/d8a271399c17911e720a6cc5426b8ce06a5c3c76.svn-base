# == Schema Information
#
# Table name: redirects
#
#  id         :integer(4)      not null, primary key
#  priority   :integer(4)      not null
#  pattern    :string(128)     not null
#  httpurl    :string(128)     default("/"), not null
#  status     :integer(4)      default(301), not null
#  flash      :string(1024)
#  enabled    :integer(4)      default(1), not null
#  created_at :datetime
#  updated_at :datetime
#

class Redirect < ActiveRecord::Base
  # ::Rails.logger.error("...")

  validates_presence_of :priority
  validates_presence_of :pattern
  validates_presence_of :httpurl
  validates_presence_of :status
  validates_presence_of :enabled

  validates_length_of :pattern, :within => 1..128
  validates_length_of :httpurl, :within => 1..128
  validates_length_of :flash, :within => 0..1024, :allow_nil => true, :allow_blank => true

end
