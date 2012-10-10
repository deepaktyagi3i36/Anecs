# == Schema Information
#
# Table name: websites
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  domain     :string(128)     not null
#  aggregator :integer(4)      default(0), not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Website do
  context "validations" do
    it { should have_many(:proposals) }
    it { should have_many(:properties) }
    it { should have_many(:runtime_settings) }
    it { should have_many(:manpages) }
    it { should have_many(:regions) }
    it { should have_many(:vacancies) }
    it { should have_many(:users) }
    it { should have_many(:feedbacks) }
    it { should have_many(:callmebacks) }
    it { should have_many(:patterns) }
    it { should have_many(:categories) }
    it { should have_many(:product_types) }
    it { should have_many(:products) }
    it { should have_many(:articles) }
    it { should have_many(:promotions) }
    it { should have_many(:storehouses) }
    it { should have_many(:shopping_carts) }
    it { should have_many(:comparators) }
    it { should have_many(:orders) }
    it { should have_many(:themes) }
    it { should have_many(:website_currencies) }
    it { should have_many(:website_languages) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:about) }
    it { should validate_presence_of(:domain) }
    it { should validate_presence_of(:aggregator) }
    it { should validate_presence_of(:primary) }
    it { should validate_presence_of(:enabled) }

    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:code).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:about).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:domain).is_at_least(1).is_at_most(128) }
  end
end
