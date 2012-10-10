# == Schema Information
#
# Table name: patterns
#
#  id              :integer(4)      not null, primary key
#  pattern_type_id :integer(4)      not null
#  name            :string(128)     not null
#  title           :string(255)     not null
#  body            :string(4000)    not null
#  created_at      :datetime
#  updated_at      :datetime
#  website_id      :integer(4)      not null
#

require 'spec_helper'

describe Pattern do
  context "validations" do
    it { should belong_to(:pattern_type) }
    it { should have_many(:instructions) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }

    it { should ensure_length_of(:name).is_at_least(1).is_at_most(256) }
    it { should ensure_length_of(:title).is_at_least(1).is_at_most(256) }
    it { should ensure_length_of(:body).is_at_least(1).is_at_most(4000) }
  end
end
