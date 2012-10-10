# == Schema Information
#
# Table name: promoitems
#
#  id           :integer(4)      not null, primary key
#  product_id   :integer(4)      not null
#  promotion_id :integer(4)      not null
#  created_at   :datetime
#  updated_at   :datetime
#

# = Entity description
#
# Connection is en entity to bind a product to category. For example user may connect
# fitness center (on of the product) with category that have name: russia, st.petersburg.
#
# == Link
# http://localhost:3000/centers. On the left side of the page a categroy is
# selected, on the right part of the page product from this category is shown.
#
# == Table information
# Quantity of record will grow during lifetime. I expect the quantity records from
# product multiple five.
#
#
class Promoitem < ActiveRecord::Base
  # ::Rails.logger.error("...")
  belongs_to :product
  belongs_to :promotion

  validates_presence_of :promotion_id
  validates_presence_of :product_id
  validates_uniqueness_of :promotion_id, :scope => :product_id
  validates_uniqueness_of :product_id, :scope => :promotion_id


end
