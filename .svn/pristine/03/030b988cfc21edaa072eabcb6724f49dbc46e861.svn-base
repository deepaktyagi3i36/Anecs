# == Schema Information
#
# Table name: admin_jobs
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  job        :string(128)     not null
#  created_at :datetime
#  updated_at :datetime
#  success    :integer(4)      default(0), not null
#  exception  :string(5000)
#  begin_at   :datetime
#  finish_at  :datetime
#

require 'spec_helper'

describe AdminJob do
  context "validations" do
    it { should have_many(:admin_job_reports) }
    it { should have_many(:runbatch_reports) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:about) }
    it { should validate_presence_of(:job) }
    it { should validate_presence_of(:success) }

    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:code).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:about).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:job).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:exception).is_at_least(0).is_at_most(5000) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_uniqueness_of(:job) }
  end
end
