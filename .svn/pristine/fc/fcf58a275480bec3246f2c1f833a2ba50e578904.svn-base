# == Schema Information
#
# Table name: feedbacks
#
#  id                :integer(4)      not null, primary key
#  user_id           :integer(4)
#  contact_type_id   :integer(4)      not null
#  contact_status_id :integer(4)      not null
#  title             :string(128)     not null
#  body              :string(512)     not null
#  created_at        :datetime
#  updated_at        :datetime
#  website_id        :integer(4)      not null
#

require 'spec_helper'

describe Feedback do
  context "validations" do
    it { should belong_to(:user) }
    it { should belong_to(:contact_type) }
    it { should belong_to(:contact_status) }

    it { should validate_presence_of(:contact_type_id) }
    it { should validate_presence_of(:contact_status_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }

    it { should ensure_length_of(:title).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:body).is_at_least(1).is_at_most(256) }
  end
end

