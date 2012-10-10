# == Schema Information
#
# Table name: alert_members
#
#  id         :integer(4)      not null, primary key
#  alert_id   :integer(4)      not null
#  user_id    :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

class AlertMember < ActiveRecord::Base
end
