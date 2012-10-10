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

require 'spec_helper'

describe Timetable do
  context "validations" do
    it { should belong_to(:product) }
    it { should belong_to(:timetable_status) }
    it { should have_many(:schedules) }
  end
end
