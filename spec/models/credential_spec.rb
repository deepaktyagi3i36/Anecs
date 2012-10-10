# == Schema Information
#
# Table name: tableless31_models
#
#  login       :string
#  password    :string
#  remember_me :string
#

require 'spec_helper'

describe Credential do
  context "validations" do
    it { should validate_presence_of(:login) }
    it { should validate_presence_of(:password) }

    it { should ensure_length_of(:password).is_at_least(4).is_at_most(40) }
  end
end
