class ProductTypePropertyFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :property_id, :integer
  column :product_type_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :property
  belongs_to :product_type


  #
  # Methods to create sql filter for centers
  def conditions
    sqlwhere = ""
    sqlwhere = sqlwhere + " product_type_properties.property_id = ? " if !property_id.nil?
    sqlwhere = sqlwhere + "and product_type_properties.product_type_id = ? " if !product_type_id.nil?

    result = []
    result << property_id if !property_id.nil?
    result << product_type_id if !product_type_id.nil?
    result
  end

  #
  # Methods to create sql filter for centers
  def child_conditions
    sqlwhere = ""
    sqlwhere = sqlwhere + "    product_type_properties.product_type_id = ? "

    result = []
    result << sqlwhere << product_type_id
    result
  end

end
