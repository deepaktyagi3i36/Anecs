# == Schema Information
#
# Table name: instructions
#
#  id         :integer(4)      not null, primary key
#  product_id :integer(4)      not null
#  pattern_id :integer(4)
#  title      :string(256)     not null
#  body       :string(16384)   not null
#  created_at :datetime
#  updated_at :datetime
#  position   :integer(4)      not null
#

require 'spec_helper'

describe Instruction do
  context "validations" do
    it { should belong_to(:product) }
    it { should belong_to(:pattern) }

    it { should validate_presence_of(:product_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:position) }

    it { should ensure_length_of(:title).is_at_least(1).is_at_most(256) }
    it { should ensure_length_of(:body).is_at_least(1).is_at_most(16384) }
    it { should validate_numericality_of(:position) }
  end
end

