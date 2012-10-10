# == Schema Information
#
# Table name: regions
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  title      :string(128)     not null
#  phone      :string(128)     not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime
#  updated_at :datetime
#  website_id :integer(4)      not null
#

require 'spec_helper'

describe Region do
  context "validations" do
    it { should have_many(:storehouses) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:about) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:phone) }

    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:code).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:about).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:title).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:phone).is_at_least(1).is_at_most(128) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_uniqueness_of(:title) }

  end
end

