# == Schema Information
#
# Table name: products
#
#  id              :integer(4)      not null, primary key
#  code            :string(128)     not null
#  name            :string(128)     not null
#  namel           :string(128)     not null
#  sketch          :string(1024)
#  about           :string(8192)    not null
#  product_type_id :integer(4)      not null
#  metakeywords    :string(255)
#  metadescription :text
#  wwwaddress      :string(255)
#  enabled         :integer(4)      default(0), not null
#  created_at      :datetime
#  updated_at      :datetime
#  website_id      :integer(4)      not null
#  ancestry        :string(255)
#  rating          :integer(10)     default(0), not null
#  weight          :integer(4)      default(0), not null
#  permalink       :string(255)
#  slug            :string(255)
#

# = Entity description
#
# Product is an entity that represent information element such as products, centers or experts.
# Product can be different, for example sport equipment or sport supplements. The same with
# centers and experts. Lest consider fitness centers as product.
#
# There are product that have hierarchy structure. For example there is a fitness chenter
# with a head, also there are brances at russian, sweden and etc. At each country there
# brances at cities and etc.All this information are stored as tree.
#
# == Link
# http://localhost:3000/centers. There is a list on the righ side of
# the  page to show all products inside inside category.
#
# == Table information
# Quantity of record will grow during lifetime. I expect 1 000-10 000 records.
#
class Product < ActiveRecord::Base
  # ::Rails.logger.error("...")
  extend FriendlyId
  friendly_id :slug , use: :slugged

  belongs_to :website
  belongs_to :product_type
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "Product"


  has_ancestry
  has_many :links, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :requests, :dependent => :destroy
  has_many :contacts, :dependent => :destroy
  has_many :variants, :order => 'variants.name', :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :bookcases, :dependent => :destroy
  has_many :timetables, :dependent => :destroy
  has_many :connections, :dependent => :destroy
  has_many :instructions, :dependent => :destroy, :order => :position
  has_many :announcements, :dependent => :destroy
  has_many :promoitems, :dependent => :destroy

  has_many :favorite_products
  has_many :categories, :through => :connections
  has_many :articles, :through => :bookcases
  has_many :children, :class_name => 'Product', :foreign_key => :parent_id

  before_save :setup_namel

  validates_presence_of :code
  validates_presence_of :name
  validates_presence_of :about
  validates_presence_of :product_type_id
  validates_presence_of :rating
  validates_presence_of :enabled

  validates_length_of :code, :within => 1..128
  validates_length_of :name, :within => 1..128
  validates_length_of :sketch, :within => 1..1024
  validates_length_of :about, :within => 1..5000
  validates_length_of :permalink, :within => 0..128
  validates_length_of :metakeywords, :within => 0..255, :allow_nil => true
  validates_length_of :metadescription, :within => 0..65535, :allow_nil => true
  validates_length_of :wwwaddress, :within => 0..128, :allow_nil => true

  validates_uniqueness_of :code


  #
  # Build URL based on slug
  def to_param
    id.to_s + "-" + slug
  end

  #
  # Method
  def has_property?(property_nm)
    variants.each do |variant|
      variant.variant_properties.each do |varprop|
        next if varprop.property.code != property_nm
        return true
      end
    end
    return false
  end

  #
  # Method
  def property_value(property_nm)
    variants.each do |variant|
      variant.variant_properties.each do |varprop|
        next if varprop.property.code != property_nm
        return varprop.value
      end
    end
    raise "unknown product property: " + property_nm.to_s
  end

  #
  # Method
  def property_value?(property_nm, raise_if_not_found = false)
    res = property_value(property_nm)
    res == "true" || res == "1"
  rescue
    raise if raise_if_not_found
    false
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

