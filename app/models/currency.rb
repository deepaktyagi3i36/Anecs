# == Schema Information
#
# Table name: currencies
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  sign       :string(8)       not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime
#  updated_at :datetime
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
class Currency < ActiveRecord::Base
  liquid_methods :name, :id, :sign

  has_many :website_currencies

  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :about
  validates_presence_of :sign

  validates_length_of :name, :within => 1..128
  validates_length_of :code, :within => 1..128
  validates_length_of :about, :within => 1..128
  validates_length_of :sign, :within => 1..8

  validates_uniqueness_of :name
  validates_uniqueness_of :code
  validates_uniqueness_of :sign



end
