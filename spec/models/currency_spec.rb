
# == Schema Information
#
# Table name: currencies
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  sign       :string(8)       not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Currency do
  context "validations" do
    it { should have_many(:website_currencies) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:about) }
    it { should validate_presence_of(:sign) }

    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:code).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:about).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:sign).is_at_least(1).is_at_most(8) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_uniqueness_of(:sign) }
  end
end


