# == Schema Information
#
# Table name: articles
#
#  id              :integer(4)      not null, primary key
#  article_type_id :integer(4)      not null
#  name            :string(128)     not null
#  namel           :string(128)     not null
#  code            :string(64)      not null
#  annotation      :string(5000)
#  content         :text(2147483647
#  pagetitle       :string(128)     not null
#  metakeywords    :string(255)     not null
#  metadescription :text            default(""), not null
#  weight          :integer(4)      default(0), not null
#  enabled         :integer(4)      default(0), not null
#  created_at      :datetime
#  updated_at      :datetime
#  website_id      :integer(4)      not null
#  ancestry        :string(255)
#  permalink       :string(255)
#  slug            :string(255)
#

require 'spec_helper'

describe Article do
  context "validations" do
    it { should belong_to(:article_type) }
    it { should belong_to(:parent) }
    it { should have_many(:bookcases) }
    it { should have_many(:children) }

    it { should validate_presence_of(:article_type_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:pagetitle) }
    it { should validate_presence_of(:metakeywords) }
    it { should validate_presence_of(:metadescription) }

    it { should ensure_length_of(:code).is_at_least(1).is_at_most(128) }
    it { should ensure_length_of(:name).is_at_least(1).is_at_most(128) }

    it { should validate_uniqueness_of(:code) }
  end
end
