# == Schema Information
#
# Table name: contracts
#
#  id               :integer(4)      not null, primary key
#  contract_type_id :integer(4)      not null
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe Contract do
  context "validations" do
    it { should belong_to(:contract_type) }
  end
end

