# == Schema Information
#
# Table name: callmebacks
#
#  id                :integer(4)      not null, primary key
#  user_id           :integer(4)
#  contact_type_id   :integer(4)      not null
#  contact_status_id :integer(4)      not null
#  phone             :string(128)     not null
#  title             :string(128)     not null
#  body              :string(512)     not null
#  created_at        :datetime
#  updated_at        :datetime
#  website_id        :integer(4)      not null
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
class Callmeback < ActiveRecord::Base
  belongs_to :website
  belongs_to :user
  belongs_to :contact_type
  belongs_to :contact_status

  validates_presence_of :contact_type_id
  validates_presence_of :contact_status_id
  validates_presence_of :phone
  validates_presence_of :title
  validates_presence_of :body

  validates_length_of :phone, :within => 1..128
  validates_length_of :title, :within => 1..128
  validates_length_of :body, :within => 1..256
end
