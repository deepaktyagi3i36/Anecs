# == Schema Information
#
# Table name: comments
#
#  id                :integer(4)      not null, primary key
#  product_id        :integer(4)      not null
#  comment_status_id :integer(4)      not null
#  comment_type_id   :integer(4)      not null
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
# Comment is a comment that user do for product. For example usual users can comment the product
# or fitness center or expert. Also these product can be commentable by expert, such comments named
# review.
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect
#
#
class Comment < ActiveRecord::Base
  belongs_to :product
  belongs_to :comment_status
  belongs_to :comment_type
  belongs_to :user
  belongs_to :author, :class_name => "Product"


  before_save :setup_titlel

  private
  def setup_titlel
    self.titlel = UnicodeUtils.downcase(title)
  end

end
