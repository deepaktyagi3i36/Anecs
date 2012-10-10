# == Schema Information
#
# Table name: opinions
#
#  id                :integer(4)      not null, primary key
#  article_id        :integer(4)      not null
#  opinion_status_id :integer(4)      not null
#  user_id           :integer(4)      not null
#  title             :string(256)     not null
#  body              :string(4000)    not null
#  rating            :integer(4)      not null
#  useful            :integer(4)      not null
#  useless           :integer(4)      not null
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Opinion do
  context "validations" do
    it { should belong_to(:opinion_status) }

  end
end
