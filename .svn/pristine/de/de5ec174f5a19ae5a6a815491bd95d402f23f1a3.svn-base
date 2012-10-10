require 'spec_helper'

describe ProductTypeProperty do
  context "validations" do
    it { should belong_to(:property) }
    it { should belong_to(:product_type) }

    it { should validate_presence_of(:property_id) }
    it { should validate_presence_of(:product_type_id) }

    it { should validate_uniqueness_of(:property_id).scoped_to(:product_type_id) }
    it { should validate_uniqueness_of(:product_type_id).scoped_to(:property_id) }
  end
end

