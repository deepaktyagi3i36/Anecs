# == Schema Information
#
# Table name: cart_items
#
#  id               :integer(4)      not null, primary key
#  shopping_cart_id :integer(4)      not null
#  variant_id       :integer(4)      not null
#  quantity         :integer(4)      not null
#  saved_for_later  :integer(4)      default(0), not null
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe CartItem do
  context "validations" do
    it { should belong_to(:variant) }
    it { should belong_to(:shopping_cart) }

    it { should validate_uniqueness_of(:variant_id).scoped_to(:shopping_cart_id, :saved_for_later) }
    it { should validate_uniqueness_of(:shopping_cart_id).scoped_to(:variant_id, :saved_for_later) }
    it { should validate_uniqueness_of(:saved_for_later).scoped_to(:shopping_cart_id, :variant_id) }

    it { should validate_presence_of(:variant) }
    it { should validate_presence_of(:shopping_cart) }
    it { should validate_presence_of(:saved_for_later) }

    [0, -1, 'ab', '$', '<1>', '', ' ', nil].each do |bad_value|
      it { should_not allow_value(bad_value).for(:quantity) }
    end

    [10, -1, 0.1, '0-', 2, '<1>', nil].each do |bad_value|
      it { should_not allow_value(bad_value).for(:saved_for_later) }
    end
  end
end

