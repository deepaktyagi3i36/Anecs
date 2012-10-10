class UserFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :login, :string
  column :user_status_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :user_status

  #
  # Methods to create sql filter for centers
  def conditions
    sqlwhere = "1 = 1 "
    sqlwhere = sqlwhere + "and users.login like ? " if is_string_here?(login)
    sqlwhere = sqlwhere + "and users.user_status_id = ? " if is_object_here?(user_status_id)
    sqlwhere = sqlwhere + "and users.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and users.created_at < ? " if is_object_here?(created_at_till)


    result = [sqlwhere]
    result << UnicodeUtils.downcase(login) if is_string_here?(login)
    result << user_status_id if is_object_here?(user_status_id)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

end
