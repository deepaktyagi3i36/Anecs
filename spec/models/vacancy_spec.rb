# == Schema Information
#
# Table name: vacancies
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  namel      :string(128)     not null
#  about      :string(128)     not null
#  title      :string(255)     not null
#  body       :string(4000)    not null
#  region_id  :integer(4)      not null
#  enabled    :integer(4)      default(0), not null
#  created_at :datetime
#  updated_at :datetime
#  website_id :integer(4)      not null
#

require 'spec_helper'

describe Vacancy do
  context "validations" do
    it { should belong_to(:website) }
    it { should belong_to(:region) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:about) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:region_id) }
    it { should validate_presence_of(:website_id) }
    it { should validate_presence_of(:enabled) }

    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:about).is_at_least(1).is_at_most(5000) }
    it { should ensure_length_of(:title).is_at_least(1).is_at_most(255) }
    it { should ensure_length_of(:body).is_at_least(1).is_at_most(4000) }

    it { should validate_uniqueness_of(:name) }
  end
end
