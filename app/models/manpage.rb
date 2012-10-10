# == Schema Information
#
# Table name: manpages
#
#  id              :integer(4)      not null, primary key
#  name            :string(128)     not null
#  namel           :string(128)     not null
#  code            :string(128)     not null
#  annotation      :string(5000)
#  content         :text(2147483647
#  pagetitle       :string(128)     not null
#  metakeywords    :string(255)     not null
#  metadescription :text            default(""), not null
#  weight          :integer(4)      default(0), not null
#  enabled         :integer(4)      default(0), not null
#  created_at      :datetime
#  updated_at      :datetime
#  website_id      :integer(4)      not null
#  ancestry        :string(255)
#  permalink       :string(255)
#  slug            :string(255)
#

# = Entity description
#
# Article is an article that registred at system. There is a library, that collect
# all articles at the system. Article can be connected with a product, such connection
# are located at bookcases table.
#
# == Link
# http://localhost:3000/library/ Here is library.
#
# == Table information
# Quantity of record will grow during lifetime, I expect about 100-1000 records.
#
#
class Manpage < ActiveRecord::Base
  # ::Rails.logger.error("...")
  extend FriendlyId
  friendly_id :slug , use: :slugged

  belongs_to :website
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "Manpage"

  has_ancestry
  has_many :children, :foreign_key => "parent_id", :class_name => "Manpage", :dependent => :destroy

  before_save :setup_namel

  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :pagetitle
  validates_presence_of :metakeywords
  validates_presence_of :metadescription

  validates_length_of :code, :within => 1..128
  validates_length_of :name, :within => 1..128

  validates_uniqueness_of :code

  private
  def setup_namel
    self.namel = UnicodeUtils.downcase(name)
  end

  #
  # Normalize to default website language
  def normalize_friendly_id(input)
    if self.website.primary_language
      language = self.website.primary_language.language
      if language.code == "russian"
        return input.to_s.to_slug.normalize(transliterations: :russian).to_s
      elsif language.code == "ukrainian"
        return input.to_s.to_slug.normalize(transliterations: :ukrainian).to_s
      else
        # default is english
        return input.to_slug.normalize.to_s
      end
    else
      # default is english
      return input.to_slug.normalize.to_s
    end
  end


end
