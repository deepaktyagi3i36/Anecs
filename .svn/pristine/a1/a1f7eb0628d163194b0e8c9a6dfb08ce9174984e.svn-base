# == Schema Information
#
# Table name: website_currencies
#
#  id          :integer(4)      not null, primary key
#  website_id  :integer(4)      not null
#  currency_id :integer(4)      not null
#  primary     :integer(4)      default(0), not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe WebsiteCurrency do
  context "validations" do
    it { should belong_to(:website) }
    it { should belong_to(:currency) }

    it { should validate_presence_of(:website_id) }
    it { should validate_presence_of(:currency_id) }

    it { should validate_uniqueness_of(:website_id).scoped_to(:currency_id) }
    it { should validate_uniqueness_of(:currency_id).scoped_to(:website_id) }
  end
end

