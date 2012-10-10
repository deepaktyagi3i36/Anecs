# == Schema Information
#
# Table name: timetables
#
#  id                  :integer(4)      not null, primary key
#  product_id          :integer(4)      not null
#  timetable_status_id :integer(4)      not null
#  user_id             :integer(4)      not null
#  name                :string(255)     not null
#  about               :string(255)     not null
#  created_at          :datetime
#  updated_at          :datetime
#

# = Entity description
#
# Timetable is en entity that contain information about timetable for center. For example there is a fitness
# center with a 2 swimming pools, then this table will contains information swimming pool1, swimming pool2
# and schedule table will have details information when each swimming pool is open or closed
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect
#
#
class Timetable < ActiveRecord::Base
  belongs_to :product
  belongs_to :timetable_status
  has_many :schedules, :dependent => :destroy

end
