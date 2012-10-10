# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  session_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  website_id :integer(4)      not null
#

require 'spec_helper'

describe ShoppingCart do
  context "validations" do
    it { should belong_to(:user) }
    it { should have_many(:cart_items) }

    it { should allow_value(nil).for(:user_id) }

    it { should validate_uniqueness_of(:user_id) }
  end
end

