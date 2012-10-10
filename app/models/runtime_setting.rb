# == Schema Information
#
# Table name: runtime_settings
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  value      :string(256)     not null
#  created_at :datetime
#  updated_at :datetime
#  website_id :integer(4)
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
class RuntimeSetting < ActiveRecord::Base
  belongs_to :website

  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :about
  validates_presence_of :value

  validates_length_of :name, :within => 1..128
  validates_length_of :code, :within => 1..128
  validates_length_of :about, :within => 1..128
  validates_length_of :value, :within => 1..256

  validates_uniqueness_of :name
  validates_uniqueness_of :code
end
