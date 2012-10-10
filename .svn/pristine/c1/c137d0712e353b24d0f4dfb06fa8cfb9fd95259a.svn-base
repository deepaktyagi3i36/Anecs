# == Schema Information
#
# Table name: tableless31_models
#
#  password              :string
#  password_confirmation :string
#


require 'spec_helper'

describe Password do
  context "validations" do
    it { should validate_presence_of(:password) }

    it { should ensure_length_of(:password).is_at_least(4).is_at_most(40) }

  end
end

