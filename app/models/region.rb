# == Schema Information
#
# Table name: regions
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  title      :string(128)     not null
#  phone      :string(128)     not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime
#  updated_at :datetime
#  website_id :integer(4)      not null
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
class Region < ActiveRecord::Base
  # ::Rails.logger.error("...")
  # include Translateable
  # translate :name, :title
  liquid_methods :id,:name, :title,:phone
  belongs_to :website
  has_many :storehouses
  has_many :vacancies

  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :about
  validates_presence_of :title
  validates_presence_of :phone

  validates_length_of :name, :within => 1..128
  validates_length_of :code, :within => 1..128
  validates_length_of :about, :within => 1..128
  validates_length_of :title, :within => 1..128
  validates_length_of :phone, :within => 1..128


  validates_uniqueness_of :name
  validates_uniqueness_of :code
  validates_uniqueness_of :title

end
