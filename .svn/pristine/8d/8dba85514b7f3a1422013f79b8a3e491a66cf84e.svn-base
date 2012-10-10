# == Schema Information
#
# Table name: promotions
#
#  id                :integer(4)      not null, primary key
#  promotion_type_id :integer(4)      not null
#  code              :string(128)     not null
#  name              :string(128)     not null
#  about             :string(128)     not null
#  title             :string(128)     not null
#  body              :string(512)     not null
#  begin_dt          :datetime        not null
#  finish_dt         :datetime        not null
#  created_at        :datetime
#  updated_at        :datetime
#  website_id        :integer(4)      not null
#

require 'spec_helper'

describe Promotion do
  context "validations" do
    it { should belong_to(:promotion_type) }
    it { should have_many(:promoitems) }

    it { should validate_presence_of(:promotion_type_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:about) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:begin_dt) }
    it { should validate_presence_of(:finish_dt) }

    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:code).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:about).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:title).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:body).is_at_least(1).is_at_most(256) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_uniqueness_of(:body) }
  end
end
