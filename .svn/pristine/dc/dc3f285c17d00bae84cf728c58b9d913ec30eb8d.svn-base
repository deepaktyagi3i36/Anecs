# == Schema Information
#
# Table name: tableless31_models
#
#  login                 :string
#  old_password          :string
#  password              :string
#  password_confirmation :string
#

require 'spec_helper'

describe ChangePassword do
  before(:each){ activate_authlogic }

  context "validations" do
    it { should validate_presence_of(:login) }
    it { should validate_presence_of(:old_password) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }

    it { should ensure_length_of(:login).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:old_password).is_at_least(4).is_at_most(40) }
    it { should ensure_length_of(:password).is_at_least(4).is_at_most(40) }

    # TODO: write test for
    # validates_confirmation_of :password

    # TODO: write test for
    # validate :validate_old_password
  end
end
