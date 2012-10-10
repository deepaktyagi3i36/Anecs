# == Schema Information
#
# Table name: favorite_products
#
#  id          :integer(4)      not null, primary key
#  favorite_id :integer(4)      not null
#  product_id  :integer(4)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

class FavoriteProduct < ActiveRecord::Base
  # ::Rails.logger.error("...")
  belongs_to :favorite
  belongs_to :product

end
