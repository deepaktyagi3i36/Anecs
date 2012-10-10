# == Schema Information
#
# Table name: requests
#
#  id                :integer(4)      not null, primary key
#  parent_id         :integer(4)
#  product_id        :integer(4)      not null
#  request_status_id :integer(4)      not null
#  user_id           :integer(4)      not null
#  author_id         :integer(4)
#  title             :string(256)     not null
#  titlel            :string(256)     not null
#  body              :string(4000)    not null
#  rating            :integer(4)      not null
#  useful            :integer(4)      not null
#  useless           :integer(4)      not null
#  created_at        :datetime
#  updated_at        :datetime
#

# = Entity description
#
# Request is en entity that contain information about product questions. For example user would like to
# ask a question about product such as product or center or expert, then user write question that
# is located at this table.
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect
#
#
class Request < ActiveRecord::Base
  belongs_to :product
  belongs_to :request_status
  belongs_to :user
  belongs_to :parent, :class_name => "Request"
  belongs_to :author, :class_name => "Product"
  has_many :answers, :foreign_key => "parent_id", :class_name => "Request", :dependent => :destroy

  before_save :setup_titlel

  #
  # Methods to find all product requests only, without child answers
  # The first param is product_id
  def self.find_requests_by_product_id(product_id)
    conditions = ""
    conditions = conditions + "    parent_id is null "
    conditions = conditions + "and product_id = ? "
    # TODO: rewriter to single sql query
    Request.find :all, :conditions => [ conditions, product_id]
  end

  private
  def setup_titlel
    self.titlel = UnicodeUtils.downcase(title)
  end

end
