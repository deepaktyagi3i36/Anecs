# == Schema Information
#
# Table name: tableless31_models
#
#  login    :string
#  password :string
#

require 'spec_helper'

describe TrackingUserOrder do
  context "validations" do
    it { should validate_presence_of(:login) }
    it { should validate_presence_of(:password) }

    it { should ensure_length_of(:login).is_at_least(3).is_at_most(40) }
    it { should ensure_length_of(:password).is_at_least(3).is_at_most(40) }
  end
end
