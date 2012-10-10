
# == Schema Information
#
# Table name: variant_properties
#
#  id          :integer(4)      not null, primary key
#  variant_id  :integer(4)      not null
#  property_id :integer(4)      not null
#  value       :string(255)     not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe VariantProperty do
  context "validations" do
    it { should belong_to(:variant) }
    it { should belong_to(:property) }

    it { should validate_presence_of(:variant_id) }
    it { should validate_presence_of(:property_id) }
    it { should validate_presence_of(:value) }

    it { should ensure_length_of(:value).is_at_least(1).is_at_most(128) }

  end
end

