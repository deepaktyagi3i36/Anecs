# == Schema Information
#
# Table name: privacies
#
#  id               :integer(4)      not null, primary key
#  user_id          :integer(4)      not null
#  privacy_type_id  :integer(4)      not null
#  privacy_value_id :integer(4)      not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Privacy < ActiveRecord::Base
  belongs_to :privacy_type
end
