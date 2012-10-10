class VariantFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :namel, :string
  column :product_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :product

  #
  def conditions(website)
    sqlwhere = " products.website_id = ? "
    sqlwhere = sqlwhere + "and products.namel like ? " if is_string_here?(namel)
    sqlwhere = sqlwhere + "and variants.product_id > ? " if is_object_here?(product_id)
    sqlwhere = sqlwhere + "and variants.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and variants.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere, website.id]
    result << UnicodeUtils.downcase(namel) if is_string_here?(namel)
    result << product_id if is_object_here?(product_id)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

end
