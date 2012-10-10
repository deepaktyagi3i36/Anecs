# == Schema Information
#
# Table name: opinions
#
#  id                :integer(4)      not null, primary key
#  article_id        :integer(4)      not null
#  opinion_status_id :integer(4)      not null
#  user_id           :integer(4)      not null
#  title             :string(256)     not null
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
class Opinion < ActiveRecord::Base
  belongs_to :opinion_status
end
