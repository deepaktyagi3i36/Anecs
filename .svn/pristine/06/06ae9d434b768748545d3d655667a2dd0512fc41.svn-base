# == Schema Information
#
# Table name: connections
#
#  id          :integer(4)      not null, primary key
#  category_id :integer(4)      not null
#  product_id  :integer(4)      not null
#  bubble      :integer(4)      default(1), not null
#  created_at  :datetime
#  updated_at  :datetime
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
class Connection < ActiveRecord::Base
  # ::Rails.logger.error("...")
  belongs_to :product
  belongs_to :category

  validates_presence_of :category_id
  validates_presence_of :product_id
  validates_uniqueness_of :category_id, :scope => :product_id
  validates_uniqueness_of :product_id, :scope => :category_id
end
