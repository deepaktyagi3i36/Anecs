class CountryFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :name, :string
  column :code, :string
  column :about, :string
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  #
  # Methods to create sql filter for centers
  def conditions
    sqlwhere = "1 = 1 "
    sqlwhere = sqlwhere + " and lower(name) like ? " if is_string_here?(name)
    sqlwhere = sqlwhere + "and code = ? " if is_string_here?(code)
    sqlwhere = sqlwhere + "and created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and created_at < ? " if is_object_here?(created_at_till)


    result = []
    result << sqlwhere << "%#{name.downcase}%" if is_string_here?(name)
    result << code if is_string_here?(code)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

end
