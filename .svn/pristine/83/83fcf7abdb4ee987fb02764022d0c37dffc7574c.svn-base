# == Schema Information
#
# Table name: products
#
#  id              :integer(4)      not null, primary key
#  code            :string(128)     not null
#  name            :string(128)     not null
#  namel           :string(128)     not null
#  sketch          :string(1024)
#  about           :string(8192)    not null
#  product_type_id :integer(4)      not null
#  metakeywords    :string(255)
#  metadescription :text
#  wwwaddress      :string(255)
#  enabled         :integer(4)      default(0), not null
#  created_at      :datetime
#  updated_at      :datetime
#  website_id      :integer(4)      not null
#  ancestry        :string(255)
#  rating          :integer(10)     default(0), not null
#  weight          :integer(4)      default(0), not null
#  permalink       :string(255)
#  slug            :string(255)
#

require 'spec_helper'

describe Product do
  context "validations" do
    it { should belong_to(:product_type) }

    it { should have_many(:links) }
    it { should have_many(:photos) }
    it { should have_many(:requests) }
    it { should have_many(:contacts) }
    it { should have_many(:variants) }
    it { should have_many(:comments) }
    it { should have_many(:bookcases) }
    it { should have_many(:timetables) }
    it { should have_many(:connections) }
    it { should have_many(:instructions) }
    it { should have_many(:announcements) }
    it { should have_many(:promoitems) }
    it { should have_many(:children) }

    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:about) }
    it { should validate_presence_of(:product_type_id) }
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:enabled) }

    it { should ensure_length_of(:code).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:sketch).is_at_least(1).is_at_most(1024) }
    it { should ensure_length_of(:about).is_at_least(1).is_at_most(5000) }
    it { should ensure_length_of(:permalink).is_at_most(128) }
    it { should ensure_length_of(:metakeywords).is_at_most(255) }
    it { should ensure_length_of(:metadescription).is_at_most(65535) }
    it { should ensure_length_of(:wwwaddress).is_at_most(128) }
  end
end
