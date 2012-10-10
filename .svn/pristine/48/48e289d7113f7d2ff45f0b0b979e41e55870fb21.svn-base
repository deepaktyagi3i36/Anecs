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

class AdminJobReport < ActiveRecord::Base
  # ::Rails.logger.error("...")

  belongs_to :admin_job

  validates_presence_of :admin_job_id
  validates_presence_of :runbatch
  validates_presence_of :message

  validates_length_of :message, :within => 1..5000

end
