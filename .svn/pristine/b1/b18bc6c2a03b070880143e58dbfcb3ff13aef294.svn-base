class ConnectionFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :category_id, :integer
  column :product_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :category
  belongs_to :product

  #
  def conditions(website)
    sqlwhere = " products.website_id = ? "
    sqlwhere = sqlwhere + "and categories.website_id = ? "
    sqlwhere = sqlwhere + "and connections.category_id > ? " if is_object_here?(category_id)
    sqlwhere = sqlwhere + "and connections.product_id > ? " if is_object_here?(product_id)
    sqlwhere = sqlwhere + "and connections.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and connections.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere, website.id, website.id]
    result << category_id if is_object_here?(category_id)
    result << product_id if is_object_here?(product_id)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end
end
