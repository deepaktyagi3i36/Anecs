# == Schema Information
#
# Table name: schedules
#
#  id           :integer(4)      not null, primary key
#  timetable_id :integer(4)      not null
#  begin_dt     :datetime        not null
#  finish_dt    :datetime        not null
#  monday       :string(256)
#  tuesday      :string(256)
#  wednesday    :string(256)
#  thursday     :string(256)
#  friday       :string(256)
#  saturday     :string(256)
#  sunday       :string(256)
#  created_at   :datetime
#  updated_at   :datetime
#

# = Entity description
#
# Schedule is en entity that contain information about timetable. For example there is a timetable
# for swimming pool, and this timetable say what time swimming pool is open or closed for every day.
# These information are stored at this tables.
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect
#
#
class Schedule < ActiveRecord::Base
  belongs_to :timetable
end
