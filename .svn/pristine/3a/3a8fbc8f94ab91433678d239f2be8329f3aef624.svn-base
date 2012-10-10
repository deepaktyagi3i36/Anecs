# == Schema Information
#
# Table name: themes
#
#  id         :integer(4)      not null, primary key
#  website_id :integer(4)      not null
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  primary    :integer(4)      default(0), not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Theme do
  context "validations" do
    it { should belong_to(:website) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:about) }
    it { should validate_presence_of(:primary) }
    it { should validate_presence_of(:enabled) }

    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:code).is_at_least(1).is_at_most(128) }
  end
end
