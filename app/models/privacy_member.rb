# == Schema Information
#
# Table name: privacy_members
#
#  id         :integer(4)      not null, primary key
#  privacy_id :integer(4)      not null
#  user_id    :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

class PrivacyMember < ActiveRecord::Base
end
