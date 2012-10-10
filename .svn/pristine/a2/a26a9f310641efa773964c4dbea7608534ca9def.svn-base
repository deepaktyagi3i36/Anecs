class CategoryFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :namel, :string
  column :about, :string
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  #
  def conditions(website)
    sqlwhere = "categories.website_id = ? "
    sqlwhere = sqlwhere + "and categories.namel like ? " if is_string_here?(namel)
    sqlwhere = sqlwhere + "and categories.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and categories.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere, website.id]
    result << UnicodeUtils.downcase(namel) if is_string_here?(namel)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

  #
  def self.website_conditions(website)
    sqlwhere = "categories.website_id = ? "
    result = [sqlwhere, website.id]
    result
  end

end
