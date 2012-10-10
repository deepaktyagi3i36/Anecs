# == Schema Information
#
# Table name: themes
#
#  id         :integer(4)      not null, primary key
#  website_id :integer(4)      not null
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  primary    :integer(4)      default(0), not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
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
class Theme < ActiveRecord::Base
  belongs_to :website

  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :about
  validates_presence_of :primary
  validates_presence_of :enabled

  validates_length_of :name, :within => 1..128
  validates_length_of :code, :within => 1..128
  validates_length_of :about, :within => 1..128

  validates_uniqueness_of :name
  validates_uniqueness_of :code
end
