# == Schema Information
#
# Table name: vacancies
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  namel      :string(128)     not null
#  about      :string(128)     not null
#  title      :string(255)     not null
#  body       :string(4000)    not null
#  region_id  :integer(4)      not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime
#  updated_at :datetime
#  website_id :integer(4)      not null
#

class Vacancy < ActiveRecord::Base
  # ::Rails.logger.error("...")
  # has_permalink :name, :update => true

  belongs_to :website
  belongs_to :region

  before_save :setup_namel

  validates_presence_of :name
  validates_presence_of :about
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :website_id
  validates_presence_of :region_id
  validates_presence_of :enabled

  validates_length_of :name, :within => 1..128
  validates_length_of :about, :within => 1..5000
  validates_length_of :title, :within => 1..255
  validates_length_of :body, :within => 1..4000

  validates_uniqueness_of :name

  private
  def setup_namel
    self.namel = UnicodeUtils.downcase(name)
  end


end
