# == Schema Information
#
# Table name: announcements
#
#  id                     :integer(4)      not null, primary key
#  product_id             :integer(4)      not null
#  announcement_status_id :integer(4)      not null
#  user_id                :integer(4)      not null
#  author_id              :integer(4)
#  title                  :string(256)     not null
#  titlel                 :string(256)     not null
#  body                   :string(4000)    not null
#  created_at             :datetime
#  updated_at             :datetime
#

class Announcement < ActiveRecord::Base
  belongs_to :product
  belongs_to :announcement_status
  belongs_to :user
  belongs_to :author, :class_name => "Product"

  before_save :setup_titlel

  private
  def setup_titlel
    self.titlel = UnicodeUtils.downcase(title)
  end

end
