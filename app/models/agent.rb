# == Schema Information
#
# Table name: agents
#
#  id         :integer(4)      not null, primary key
#  product_id :integer(4)      not null
#  user_id    :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Agent < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
end
