# == Schema Information
#
# Table name: admin_job_reports
#
#  id           :integer(4)      not null, primary key
#  admin_job_id :integer(4)      not null
#  runbatch     :integer(4)      not null
#  message      :string(5000)    not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe AdminJobReport do
  context "validations" do
    it { should belong_to(:admin_job) }

    it { should validate_presence_of(:admin_job_id) }
    it { should validate_presence_of(:runbatch) }
    it { should validate_presence_of(:message) }

    it { should ensure_length_of(:message).is_at_least(1).is_at_most(5000) }

    # TODO:
    # it { should validate_uniqueness_of(:user_id,:role_id) }
  end
end
