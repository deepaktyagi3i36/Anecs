# == Schema Information
#
# Table name: requests
#
#  id                :integer(4)      not null, primary key
#  parent_id         :integer(4)
#  product_id        :integer(4)      not null
#  request_status_id :integer(4)      not null
#  user_id           :integer(4)      not null
#  author_id         :integer(4)
#  title             :string(256)     not null
#  titlel            :string(256)     not null
#  body              :string(4000)    not null
#  rating            :integer(4)      not null
#  useful            :integer(4)      not null
#  useless           :integer(4)      not null
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Request do
  context "validations" do
    it { should belong_to(:product) }
    it { should belong_to(:request_status) }
    it { should belong_to(:user) }
    it { should belong_to(:parent) }
    it { should belong_to(:author) }
    it { should have_many(:answers) }
  end
end

