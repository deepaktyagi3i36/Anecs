# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  code       :string(128)     not null
#  name       :string(128)     not null
#  namel      :string(128)     not null
#  about      :string(5000)    not null
#  weight     :integer(4)      default(0), not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime
#  updated_at :datetime
#  website_id :integer(4)      not null
#  ancestry   :string(255)
#  permalink  :string(255)
#  slug       :string(255)
#

require 'spec_helper'

describe Category do
  context "validations" do
    #it { should validate_presence_of(:priority) }
    #it { should ensure_length_of(:pattern).is_at_least(1).is_at_most(128) }
    #it { should validate_uniqueness_of(:pattern) }
    # # TODO: fix this code after portint from tests to specs
    it { should belong_to(:root) }
    it { should belong_to(:parent) }
    it { should have_many(:connections) }
    it { should have_many(:children) }

    it { should validate_presence_of(:code) }
    it {should validate_presence_of(:name) }
    it { should validate_presence_of(:about) }


    it { should ensure_length_of(:code).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:about).is_at_least(1).is_at_most(5000) }

    it { should validate_uniqueness_of(:code) }
  end
end
