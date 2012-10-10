class ContactFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :name, :string
  column :code, :string
  column :about, :string
  column :enabled, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  #
  # Methods to create sql filter for centers
  def conditions
    sqlwhere = "1 = 1"
    sqlwhere = sqlwhere + " and lower(name) like ? " if is_string_here?(name)
    sqlwhere = sqlwhere + " and lower(code) like ? " if is_string_here?(code)
    sqlwhere = sqlwhere + " and lower(about) like ? " if is_string_here?(about)
    sqlwhere = sqlwhere + " and enabled = ? " if !enabled.nil?
    sqlwhere = sqlwhere + " and created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + " and created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere]
    result << "%#{UnicodeUtils.downcase(name)}%" if is_string_here?(name)
    result << "%#{code}%" if is_string_here?(code)
    result << "%#{about}%" if is_string_here?(about)
    result << enabled if !enabled.nil?
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end
end
