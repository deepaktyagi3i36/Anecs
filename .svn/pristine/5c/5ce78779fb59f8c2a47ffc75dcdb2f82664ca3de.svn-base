# == Schema Information
#
# Table name: promoitems
#
#  id           :integer(4)      not null, primary key
#  product_id   :integer(4)      not null
#  promotion_id :integer(4)      not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Promoitem do
  context "validations" do
    it { should belong_to(:promotion) }
    it { should belong_to(:product) }

    it { should validate_presence_of(:promotion_id) }
    it { should validate_presence_of(:product_id) }

    it { should validate_uniqueness_of(:promotion_id).scoped_to(:product_id) }
    it { should validate_uniqueness_of(:product_id).scoped_to(:promotion_id) }

  end
end
