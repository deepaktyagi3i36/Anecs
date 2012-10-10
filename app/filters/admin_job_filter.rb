class AdminJobFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :name, :string
  column :code, :string
  column :about, :string
  column :created_at_since, :datetime
  column :created_at_till, :datetime


  #
  # Methods to create sql filter for centers
  def conditions
    sqlwhere = ""
    sqlwhere = sqlwhere + "    admin_jobs.name like ? " if is_string_here?(name)
    sqlwhere = sqlwhere + "and admin_jobs.code like ? " if is_string_here?(code)
    sqlwhere = sqlwhere + "and admin_jobs.about like ? " if is_string_here?(about)
    sqlwhere = sqlwhere + "and admin_jobs.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and admin_jobs.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere]
    result << name if is_string_here?(name)
    result << code if is_string_here?(code)
    result << about if is_string_here?(about)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

end
