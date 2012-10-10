class ProductTypeFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :name, :string
  column :code, :string
  column :about, :string
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  #
  def conditions(website)
    sqlwhere = "product_types.website_id = ? "
    sqlwhere = sqlwhere + "and product_types.name like ? " if is_string_here?(name)
    sqlwhere = sqlwhere + "and product_types.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and product_types.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere, website.id]
    result << UnicodeUtils.downcase(namel) if is_string_here?(name)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

  #
  def self.website_conditions(website)
    sqlwhere = "product_types.website_id = ? "
    result = [sqlwhere, website.id]
    result
  end


end
