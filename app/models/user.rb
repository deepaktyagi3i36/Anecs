# == Schema Information
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  user_status_id    :integer(4)      not null
#  firstname         :string(255)     not null
#  lastname          :string(255)     not null
#  nickname          :string(255)     not null
#  login             :string(255)
#  email             :string(255)
#  crypted_password  :string(255)     default(""), not null
#  password_salt     :string(255)     default(""), not null
#  created_at        :datetime
#  updated_at        :datetime
#  middlename        :string(255)
#  persistence_token :string(255)     not null
#  website_id        :integer(4)
#  allow_email       :integer(4)      default(0), not null
#  active            :boolean(1)      default(FALSE), not null
#  perishable_token  :string(255)     not null
#  login_count       :integer(4)      default(0), not null
#  last_request_at   :datetime
#  last_login_at     :datetime
#  current_login_at  :datetime
#  last_login_ip     :string(255)
#  current_login_ip  :string(255)
#

# = Entity description
#
# User is an entity that describe user at system
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect not more than 100 000- 1 000 000 records
#
#

require 'digest/sha1'
class User < ActiveRecord::Base
  # ::Rails.logger.error("...")

  liquid_methods :user_has_role,:nickname,:email
  acts_as_authentic do |configuration|
    #configuration.login_field = :email
    configuration.session_class = UserSession
    #configuration.act_like_restful_authentication = true
    #configuration.transition_from_restful_authentication = true
  end

  # Include rmagick captcha
  has_rmagick_captcha :captcha
  validate :validate_rmagick_captcha

  belongs_to :website
  belongs_to :user_status

  has_many :addresses, :dependent => :destroy
  has_many :agents, :dependent => :destroy
  has_many :announcements, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :complaints, :dependent => :destroy
  has_many :requests, :dependent => :destroy
  has_many :user_roles, :dependent => :destroy
  has_many :feedbacks, :dependent => :destroy
  has_many :callmebacks, :dependent => :destroy

  has_many :orders
  has_one :comparator, :dependent => :destroy
  has_one :favorite, :dependent => :destroy
  has_one :shopping_cart, :dependent => :destroy

  validates_presence_of :user_status_id
  validates_presence_of :nickname
  validates_presence_of :firstname
  validates_presence_of :middlename
  validates_presence_of :lastname
  validates_presence_of :email
  validates_presence_of :login
  validates_presence_of :password
  validates_presence_of :password_confirmation

  validates_confirmation_of :password

  validates_length_of :nickname, :within => 1..128
  validates_length_of :firstname, :within => 1..128
  validates_length_of :middlename, :within => 1..128
  validates_length_of :lastname, :within => 1..128
  validates_length_of :email, :within => 1..128
  validates_length_of :login, :within => 1..128
  validates_length_of :password, :within => 4..40

  validates_uniqueness_of :login
  validates_uniqueness_of :email

  #
  # Role name, for example moderator or admin
  def has_role?(role, subject = nil)
    user_roles.each do |user_role|
      return true if user_role.role.code.to_s == role.to_s
    end
    false
  end

  def user_has_role
     @user_role_array = Array.new
     user_roles.each do |user_role|
       @user_role_array << user_role.role.code.to_s
     end
     return @user_role_array
  end

end
