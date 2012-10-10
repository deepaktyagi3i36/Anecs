# == Schema Information
#
# Table name: user_tags
#
#  id         :integer(4)      not null, primary key
#  tag_id     :integer(4)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

# = Entity description
#
# User is an entity that describe user at system
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect not more than 100 000- 1 000 000 records
#
#

class UserTag < ActiveRecord::Base
  # ::Rails.logger.error("...")


end
