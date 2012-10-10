# == Schema Information
#
# Table name: opinion_statuses
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe OpinionStatus do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:about) }

    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:code).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:about).is_at_least(1).is_at_most(128) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:code) }
  end
end

