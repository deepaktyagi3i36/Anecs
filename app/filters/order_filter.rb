class OrderFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :namel, :string
  column :email, :string
  column :street_address1, :string
  column :street_address2, :string
  column :order_state_id, :integer
  column :checkout_state_id, :integer
  column :user_id, :integer
  column :shipping_type_id, :integer
  column :payment_type_id, :integer
  column :address_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  Order.reflect_on_all_associations(:belongs_to).each do |reflection|
    belongs_to reflection.name
  end

  #
  # Methods to create sql filter for centers
  def conditions
    sqlwhere = "1 = 1 "
    sqlwhere = sqlwhere + "and orders.namel like ? " if is_string_here?(namel)
    sqlwhere = sqlwhere + "and orders.email like ? " if is_string_here?(email)
    sqlwhere = sqlwhere + "and addresses.street_address1 like ? " if is_string_here?(street_address1)
    sqlwhere = sqlwhere + "and addresses.street_address2 like ? " if is_string_here?(street_address2)
    sqlwhere = sqlwhere + "and orders.user_id = ? " if is_object_here?(user_id)
    sqlwhere = sqlwhere + "and orders.order_state_id = ? " if is_object_here?(order_state_id)
    sqlwhere = sqlwhere + "and orders.checkout_state_id = ? " if is_object_here?(checkout_state_id)
    sqlwhere = sqlwhere + "and orders.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and orders.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere]
    result << UnicodeUtils.downcase(namel) if is_string_here?(namel)
    result << UnicodeUtils.downcase(email) if is_string_here?(email)
    result << UnicodeUtils.downcase(street_address1) if is_string_here?(street_address1)
    result << UnicodeUtils.downcase(street_address2) if is_string_here?(street_address2)
    result << user_id if is_object_here?(user_id)
    result << order_state_id if is_object_here?(order_state_id)
    result << checkout_state_id if is_object_here?(checkout_state_id)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

end
