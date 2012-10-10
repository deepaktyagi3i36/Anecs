# == Schema Information
#
# Table name: redirects
#
#  id         :integer(4)      not null, primary key
#  priority   :integer(4)      not null
#  pattern    :string(128)     not null
#  httpurl    :string(128)     default("/"), not null
#  status     :integer(4)      default(301), not null
#  flash      :string(1024)
#  enabled    :integer(4)      default(1), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Redirect do
  context "validations" do
    it { should validate_presence_of(:priority) }
    it { should validate_presence_of(:pattern) }
    it { should validate_presence_of(:httpurl) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:enabled) }

    it { should ensure_length_of(:pattern).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:httpurl).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:flash).is_at_least(0).is_at_most(1024) }
  end
end
