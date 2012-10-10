class OrderVariantFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :order_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :order

  #
  # Methods to create sql filter for centers
  def conditions
    sqlwhere = "1 = 1 "
    sqlwhere = sqlwhere + "and order_variants.order_id = ? " if is_object_here?(order_id)

    result = [sqlwhere]
    result << order_id if is_object_here?(order_id)
    result
  end

end
