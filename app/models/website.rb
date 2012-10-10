# == Schema Information
#
# Table name: websites
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  domain     :string(128)     not null
#  aggregator :integer(4)      default(0), not null
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
class Website < ActiveRecord::Base
  has_one :primary_language, :foreign_key => "website_id",
          :class_name => "WebsiteLanguage",:conditions => ["website_languages.primary = 1"]
  has_one :primary_currency, :foreign_key => "website_id",
          :class_name => "WebsiteCurrency",:conditions => ["website_currencies.primary = 1"]

  has_many :properties
  has_many :runtime_settings
  has_many :manpages
  has_many :regions
  has_many :vacancies
  has_many :users
  has_many :feedbacks
  has_many :callmebacks
  has_many :patterns
  has_many :categories
  has_many :product_types
  has_many :products
  has_many :articles
  has_many :promotions
  has_many :storehouses
  has_many :shopping_carts
  has_many :comparators
  has_many :orders
  has_many :themes
  has_many :website_languages
  has_many :website_currencies
  has_many :primary_languages, :foreign_key => "website_id",
          :class_name => "WebsiteLanguage",:conditions => ["website_languages.primary = 1"]
  has_many :primary_currencies, :foreign_key => "website_id",
          :class_name => "WebsiteCurrency",:conditions => ["website_currencies.primary = 1"]


  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :about
  validates_presence_of :domain
  validates_presence_of :primary
  validates_presence_of :enabled

  validates_length_of :name, :within => 1..128
  validates_length_of :code, :within => 1..128
  validates_length_of :about, :within => 1..128
  validates_length_of :domain, :within => 1..128

  validates_uniqueness_of :name
  validates_uniqueness_of :code
  validates_uniqueness_of :domain

end
