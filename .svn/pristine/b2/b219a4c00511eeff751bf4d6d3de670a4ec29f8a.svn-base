# == Schema Information
#
# Table name: user_roles
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)      not null
#  role_id    :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  validates_presence_of :user_id
  validates_presence_of :role_id

  validates_uniqueness_of :user_id, :scope => [:role_id]
  validates_uniqueness_of :role_id, :scope => [:user_id]

  #
  # Methods to find all user's roles
  # First paramter is user_id
  def self.find_by_user_id(user_id)
    UserRole.find :all, :conditions => ["user_id = ? ", user_id]
  end

end
