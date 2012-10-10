# == Schema Information
#
# Table name: photos
#
#  id                   :integer(4)      not null, primary key
#  product_id           :integer(4)      not null
#  primary              :integer(4)      default(0), not null
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer(4)
#  picture_updated_at   :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

# = Entity description
#
# Photo is en entity that store images for each product.
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect
#
#
class Photo < ActiveRecord::Base
  # Cache fu is not used more
  # acts_as_cached
  belongs_to :product
  attr_accessible :product_id, :primary, :picture
  has_attached_file :picture,
                    :url => '/system/:class/:attachment/:id/:style/:filename',
                    :styles => {
                      :huge => {:geometry => "400x400",
                                :position => "center", :processors => [:watermark],
                                :watermark_path => "#{::Rails.root.to_s}/public/images/watermarks/label.png"},
                      :large => {:geometry => "160x160"},
                      :small => {:geometry => "90x90"},
                      :thumb => {:geometry => "50x50"}
                    }
  #attr_reader :picture_content_type
  validates_attachment_size :picture, { :in=> 1..5.megabyte }
  validates_attachment_content_type :picture, { :content_type => ['image/png','image/jpg','image/x-png','image/jpeg'],
                                              :message => lambda {|c,i| "the allowed file types are png and jpg, but got #{c}"} }

end
