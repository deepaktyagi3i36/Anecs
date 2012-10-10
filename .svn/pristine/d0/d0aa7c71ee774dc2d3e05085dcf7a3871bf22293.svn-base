# == Schema Information
#
# Table name: website_languages
#
#  id          :integer(4)      not null, primary key
#  website_id  :integer(4)      not null
#  language_id :integer(4)      not null
#  primary     :integer(4)      default(0), not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
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
class WebsiteLanguage < ActiveRecord::Base
  # ::Rails.logger.error("...")
  # ::Rails.logger.error("...")
  belongs_to :website
  belongs_to :language

  validates_presence_of :website_id
  validates_presence_of :language_id
  validates_uniqueness_of :website_id, :scope => :language_id
  validates_uniqueness_of :language_id, :scope => :website_id
end
