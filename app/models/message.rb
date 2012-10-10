# == Schema Information
#
# Table name: messages
#
#  id         :integer(4)      not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Message < ActiveRecord::Base
end
