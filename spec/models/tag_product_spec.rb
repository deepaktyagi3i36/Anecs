# == Schema Information
#
# Table name: tag_products
#
#  id         :integer(4)      not null, primary key
#  tag_id     :integer(4)      not null
#  product_id :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe TagProduct do
  context "validations" do
  end
end
