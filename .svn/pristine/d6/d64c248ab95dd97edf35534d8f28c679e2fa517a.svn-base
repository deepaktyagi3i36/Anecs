# == Schema Information
#
# Table name: product_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  created_at :datetime
#  updated_at :datetime
#  website_id :integer(4)      not null
#

require 'spec_helper'

describe ProductType do
  context "validations" do
    it { should have_many(:products) }
    it { should have_many(:product_type_properties) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:about) }

    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:code).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:about).is_at_least(1).is_at_most(128) }

    it { should validate_uniqueness_of(:name).scoped_to(:website_id) }
    it { should validate_uniqueness_of(:website_id).scoped_to(:name) }

    it { should validate_uniqueness_of(:code).scoped_to(:website_id) }
    it { should validate_uniqueness_of(:website_id).scoped_to(:code) }
  end
end
