# == Schema Information
#
# Table name: invalid_routes
#
#  id         :integer(4)      not null, primary key
#  priority   :integer(4)      not null
#  pattern    :string(128)     not null
#  enabled    :integer(4)      default(1), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe InvalidRoute do
  context "validations" do
    it { should validate_presence_of(:priority) }
    it { should validate_presence_of(:pattern) }
    it { should validate_presence_of(:enabled) }

    it { should ensure_length_of(:pattern).is_at_least(1).is_at_most(128) }

    it { should validate_uniqueness_of(:pattern) }
  end
end
