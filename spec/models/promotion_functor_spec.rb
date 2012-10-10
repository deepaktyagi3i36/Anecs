# == Schema Information
#
# Table name: promotion_functors
#
#  id           :integer(4)      not null, primary key
#  promotion_id :integer(4)      not null
#  name         :string(128)     not null
#  about        :string(128)     not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe PromotionFunctor do
  context "validations" do
  end
end
