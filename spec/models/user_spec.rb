# == Schema Information
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  user_status_id    :integer(4)      not null
#  firstname         :string(255)     not null
#  lastname          :string(255)     not null
#  nickname          :string(255)     not null
#  login             :string(255)
#  email             :string(255)
#  crypted_password  :string(255)     default(""), not null
#  password_salt     :string(255)     default(""), not null
#  created_at        :datetime
#  updated_at        :datetime
#  middlename        :string(255)
#  persistence_token :string(255)     not null
#  website_id        :integer(4)
#  allow_email       :integer(4)      default(0), not null
#  active            :boolean(1)      default(FALSE), not null
#  perishable_token  :string(255)     not null
#  login_count       :integer(4)      default(0), not null
#  last_request_at   :datetime
#  last_login_at     :datetime
#  current_login_at  :datetime
#  last_login_ip     :string(255)
#  current_login_ip  :string(255)
#

require 'spec_helper'

describe User do
  context "validations" do
    it { should belong_to(:user_status) }
    it { should have_many(:user_roles) }

    it { should validate_presence_of(:user_status_id) }
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:middlename) }
    it { should validate_presence_of(:lastname) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:login) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }

    it { should ensure_length_of(:nickname).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:firstname).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:middlename).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:lastname).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:email).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:login).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:password).is_at_least(4).is_at_most(40) }

    it { should validate_uniqueness_of(:login) }
    it { should validate_uniqueness_of(:email) }

  end
end
