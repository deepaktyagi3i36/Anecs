# == Schema Information
#
# Table name: user_roles
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)      not null
#  role_id    :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe UserRole do
  context "validations" do
    it { should belong_to(:user) }
    it { should belong_to(:role) }

    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:role_id) }

    it { should validate_uniqueness_of(:user_id).scoped_to(:role_id) }
    it { should validate_uniqueness_of(:role_id).scoped_to(:user_id) }
  end
end
