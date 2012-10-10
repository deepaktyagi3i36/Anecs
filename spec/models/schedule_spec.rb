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

require 'spec_helper'

describe Schedule do
  context "validations" do
    it { should belong_to(:timetable) }
  end
end
