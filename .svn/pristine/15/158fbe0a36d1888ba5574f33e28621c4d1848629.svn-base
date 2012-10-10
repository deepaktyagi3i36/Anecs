# == Schema Information
#
# Table name: promotions
#
#  id                :integer(4)      not null, primary key
#  promotion_type_id :integer(4)      not null
#  code              :string(128)     not null
#  name              :string(128)     not null
#  about             :string(128)     not null
#  title             :string(128)     not null
#  body              :string(512)     not null
#  begin_dt          :datetime        not null
#  finish_dt         :datetime        not null
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
class Promotion < ActiveRecord::Base
  belongs_to :website
  belongs_to :promotion_type
  has_many :promoitems, :dependent => :destroy

  validates_presence_of :promotion_type_id
  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :about
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :begin_dt
  validates_presence_of :finish_dt

  validates_length_of :name, :within => 1..128
  validates_length_of :code, :within => 1..128
  validates_length_of :about, :within => 1..128
  validates_length_of :title, :within => 1..128
  validates_length_of :body, :within => 1..256

  validates_uniqueness_of :name
  validates_uniqueness_of :code
  validates_uniqueness_of :title
  validates_uniqueness_of :body

end
