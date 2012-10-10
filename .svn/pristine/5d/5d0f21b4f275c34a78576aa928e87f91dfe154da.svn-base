class ProductFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :namel, :string
  column :product_type_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :product_type

  #
  def conditions(website)
    sqlwhere = "products.website_id = ? "
    sqlwhere = sqlwhere + "and products.product_type_id = ? " if is_object_here?(product_type_id)
    sqlwhere = sqlwhere + "and products.namel like ? " if is_string_here?(namel)
    sqlwhere = sqlwhere + "and products.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and products.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere, website.id]
    result << product_type_id if is_object_here?(product_type_id)
    result << UnicodeUtils.downcase(namel) if is_string_here?(namel)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

  #
  def self.website_conditions(website)
    sqlwhere = "products.website_id = ? "
    [sqlwhere, website.id]
  end

  #
  def self.by_category_conditions(category, region)
    sqlwhere = "connections.category_id = ? "
    [sqlwhere, category.id]
  end

end
