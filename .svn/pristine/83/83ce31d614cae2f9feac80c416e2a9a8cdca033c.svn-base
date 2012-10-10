class UserRoleFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :role_id, :integer
  column :user_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :role
  belongs_to :user


  #
  # Methods to create sql filter for centers
  def conditions
    sqlwhere = "1 = 1 ";
    sqlwhere = sqlwhere + "and user_roles.role_id = ? " if is_object_here?(role_id)
    sqlwhere = sqlwhere + "and user_roles.user_id = ? " if is_object_here?(user_id)
    sqlwhere = sqlwhere + "and user_roles.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and user_roles.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere]
    result << role_id if is_object_here?(role_id)
    result << user_id if is_object_here?(user_id)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end


end
