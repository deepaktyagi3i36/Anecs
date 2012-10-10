# == Schema Information
#
# Table name: connections
#
#  id          :integer(4)      not null, primary key
#  category_id :integer(4)      not null
#  product_id  :integer(4)      not null
#  bubble      :integer(4)      default(1), not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Connection do
  context "validations" do
    it { should belong_to(:category) }
    it { should belong_to(:product) }

    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:product_id) }

    it { should validate_uniqueness_of(:category_id).scoped_to(:product_id) }
    it { should validate_uniqueness_of(:product_id).scoped_to(:category_id) }
  end
end

