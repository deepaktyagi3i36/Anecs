# == Schema Information
#
# Table name: bookcases
#
#  id         :integer(4)      not null, primary key
#  product_id :integer(4)      not null
#  article_id :integer(4)      not null
#  annotation :string(16384)   not null
#  position   :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

# = Entity description
#
# Bookcases is a connection product with an article. Sometime usefull to get more information
# about product, for example product. This connection allow to find a article where this product
# is noticed.
#
# == Link
# http://localhost:3000/products/bookcases/index?category=35&product=18
#
# == Table information
# Quantity of record will grow during lifetime, I expect
#
#
class Bookcase < ActiveRecord::Base
  belongs_to :article
  belongs_to :product
end
