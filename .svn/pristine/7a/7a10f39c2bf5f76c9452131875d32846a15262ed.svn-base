# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  code       :string(128)     not null
#  name       :string(128)     not null
#  namel      :string(128)     not null
#  about      :string(5000)    not null
#  weight     :integer(4)      default(0), not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime
#  updated_at :datetime
#  website_id :integer(4)      not null
#  ancestry   :string(255)
#  permalink  :string(255)
#  slug       :string(255)
#

# = Entity description
#
# Category is entity that allow to arbitrary group products. Category itself is a
# tree structure to allow a hierarhy groping. Lets consider fitness centers as product.
# There are a lot of fitness centers that are located at different cities. We can create
# a category to group by city, for example: by localtion: by city: [at moscow,
# at st petersbur] and etc
#
# == Link
# http://localhost:3000/centers. There is a tree on the left side of the
# page to show all categories. Root category items is depected as main menu items.
#
# == Table information
# Quantity of record will grow during lifetime, I expect not more than 100-1000 records
#
#
class Category < ActiveRecord::Base
  # ::Rails.logger.error("...")
  extend FriendlyId
  friendly_id :slug , use: :slugged

  liquid_methods :code,:name,:about

  belongs_to :website
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "Category"

  has_ancestry
  has_many :connections, :dependent => :destroy
  has_many :children, :foreign_key => "parent_id", :class_name => "Category"

  before_save :setup_namel

  validates_presence_of :code
  validates_presence_of :name
  validates_presence_of :about

  validates_length_of :code, :within => 1..128
  validates_length_of :name, :within => 1..128
  validates_length_of :about, :within => 1..5000

  validates_uniqueness_of :code

  #
  # Build URL based on slug
  def to_param
    id.to_s + "-" + slug
  end

  private
  def setup_namel
    self.namel = UnicodeUtils.downcase(name)
  end

  #
  # Normalize to default website language
  def normalize_friendly_id(input)
    if self.website.primary_language
      language = self.website.primary_language.language
      if language.code == "russian"
        return input.to_s.to_slug.normalize(transliterations: :russian).to_s
      elsif language.code == "ukrainian"
        return input.to_s.to_slug.normalize(transliterations: :ukrainian).to_s
      else
        # default is english
        return input.to_slug.normalize.to_s
      end
    else
      # default is english
      return input.to_slug.normalize.to_s
    end
  end
end
