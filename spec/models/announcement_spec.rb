# == Schema Information
#
# Table name: announcements
#
#  id                     :integer(4)      not null, primary key
#  product_id             :integer(4)      not null
#  announcement_status_id :integer(4)      not null
#  user_id                :integer(4)      not null
#  author_id              :integer(4)
#  title                  :string(256)     not null
#  titlel                 :string(256)     not null
#  body                   :string(4000)    not null
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe Announcement do
  context "validations" do
    it { should belong_to(:product) }
    it { should belong_to(:announcement_status) }
    it { should belong_to(:user) }
    it { should belong_to(:author) }
  end
end
