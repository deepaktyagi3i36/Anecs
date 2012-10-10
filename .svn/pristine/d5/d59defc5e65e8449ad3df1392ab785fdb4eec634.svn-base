class ThemeFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :website_id, :integer
  column :name, :string
  column :code, :string
  column :about, :string
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  #
  # Methods to create sql filter for centers
#
  def conditions(website)
    sqlwhere = "themes.website_id = ? "
    sqlwhere = sqlwhere + "and themes.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and themes.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere, website.id]
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

end
