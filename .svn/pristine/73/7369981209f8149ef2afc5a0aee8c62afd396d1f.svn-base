# == Schema Information
#
# Table name: variants
#
#  id          :integer(4)      not null, primary key
#  product_id  :integer(4)      not null
#  name        :string(128)     not null
#  namel       :string(128)     not null
#  price       :decimal(10, 2)  default(0.0), not null
#  currency_id :integer(4)      not null
#  enabled     :integer(4)      default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#

# = Entity description
#
# Variant is en entity that contain information about product. For example there product a protein bar. Protein
# bar can have chocolate or vanil or others tastes. So variant this is product with property collection. Single
# product may have a few variants. Also a fittness center or expert can have variant. In this case can be only
# one variant that contain a property collection for this product.
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect
#
#
class Variant < ActiveRecord::Base
  # ::Rails.logger.error("...")
  #include Translateable
  #translate :name

  before_save :setup_namel


  belongs_to :product
  belongs_to :currency
  has_many :cart_items
  has_many :comparator_items, :dependent => :destroy
  has_many :variant_properties, :dependent => :destroy
  has_many :inventories, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :enabled

  validates_length_of :name, :within => 1..128

  # Returns the number of variants left in the region's storehouse
  def quantity_by_region(region_id)
    result = 0
    inventories.each do |inv|
      if region_id.nil? or inv.storehouse.region_id == region_id
        result += inv.quantity
      end
    end
    result
  end

  private
  def setup_namel
    self.namel = UnicodeUtils.downcase(name)
  end

end
