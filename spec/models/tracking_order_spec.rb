# == Schema Information
#
# Table name: tableless31_models
#
#  email   :string
#  invoice :string
#

require 'spec_helper'

describe TrackingOrder do
  context "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:invoice) }

    it { should ensure_length_of(:email).is_at_least(3).is_at_most(100) }
    it { should ensure_length_of(:invoice).is_at_least(3).is_at_most(100) }

  end
end
