# == Schema Information
#
# Table name: website_languages
#
#  id          :integer(4)      not null, primary key
#  website_id  :integer(4)      not null
#  language_id :integer(4)      not null
#  primary     :integer(4)      default(0), not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe WebsiteLanguage do
  context "validations" do
    it { should belong_to(:website) }
    it { should belong_to(:language) }

    it { should validate_presence_of(:website_id) }
    it { should validate_presence_of(:language_id) }

    it { should validate_uniqueness_of(:website_id).scoped_to(:language_id) }
    it { should validate_uniqueness_of(:language_id).scoped_to(:website_id) }
  end
end

