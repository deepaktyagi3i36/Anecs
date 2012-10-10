# == Schema Information
#
# Table name: alerts
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)      not null
#  alert_type_id  :integer(4)      not null
#  alert_value_id :integer(4)      not null
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Alert do
  context "validations" do
    it { should belong_to(:alert_type) }
  end
end
