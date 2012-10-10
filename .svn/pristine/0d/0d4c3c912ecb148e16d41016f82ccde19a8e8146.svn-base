# == Schema Information
#
# Table name: complaints
#
#  id                  :integer(4)      not null, primary key
#  user_id             :integer(4)      not null
#  complaint_type_id   :integer(4)      not null
#  complaint_status_id :integer(4)      not null
#  title               :string(128)     not null
#  body                :string(512)     not null
#  created_at          :datetime
#  updated_at          :datetime
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
class Complaint < ActiveRecord::Base
  belongs_to :user
  belongs_to :complaint_type
  belongs_to :complaint_status

  validates_presence_of :user_id
  validates_presence_of :complaint_type_id
  validates_presence_of :complaint_status_id
  validates_presence_of :title
  validates_presence_of :body

  validates_length_of :title, :within => 1..128
  validates_length_of :body, :within => 1..256

end
