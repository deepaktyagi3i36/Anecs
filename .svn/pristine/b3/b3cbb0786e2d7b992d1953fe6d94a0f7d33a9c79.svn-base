# == Schema Information
#
# Table name: favorites
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Favorite < ActiveRecord::Base
  # ::Rails.logger.error("...")
  belongs_to :user
  has_many :favorite_products
  has_many :favorite_products, :through => :favorite_products,
      :source => :product, :conditions => ['type = ?', 'Product'], :class_name => 'Product'
  has_many :favorite_centers, :through => :favorite_products,
      :source => :product, :conditions => ['type = ?', 'Center'], :class_name => 'Center'
  has_many :favorite_experts, :through => :favorite_products,
      :source => :product, :conditions => ['type = ?', 'Expert'], :class_name => 'Expert'

  def add_product(product_id)
    item = favorite_products.find :first, :conditions => ['product_id = ?', product_id]
    if item.nil?
      item = FavoriteProduct.create :favorite_id => id, :product_id => product_id
      item.save
    end
  end

  def remove_product(product_id)
    item = favorite_products.find :first, :conditions => ['product_id = ?', product_id]
    unless item.nil?
      FavoriteProduct.delete(item.id)
    end
  end

end
