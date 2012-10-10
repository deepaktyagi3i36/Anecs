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

# = Entity description
#
# WillPaginate adds +paginate+, +per_page+ and other methods to
#
# == Examples
#
# In ActiveRecord finders, <tt>:order</tt> parameter specifies columns for
# PostgreSQL.
#
class AdminJob < ActiveRecord::Base
  # ::Rails.logger.error("...")

  has_many :admin_job_reports, :order => 'id', :dependent => :destroy
  has_many :runbatch_reports,
    :foreign_key => "admin_job_id", :class_name => "AdminJobReport",
    :conditions => AdminJobReportFilter.delayed_last_runbatch, :order => 'id'

  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :about
  validates_presence_of :job
  validates_presence_of :success

  validates_length_of :name, :within => 1..128
  validates_length_of :code, :within => 1..128
  validates_length_of :about, :within => 1..128
  validates_length_of :job, :within => 1..128
  validates_length_of :exception, :within => 0..5000, :allow_nil => true, :allow_blank => true


  validates_uniqueness_of :name
  validates_uniqueness_of :code
  validates_uniqueness_of :job

end
