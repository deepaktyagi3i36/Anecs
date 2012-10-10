class AnnouncementFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :titlel
  column :product_id, :integer
  column :announcement_status_id, :integer
  column :user_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :product
  belongs_to :announcement_status
  belongs_to :user


  #
  # Methods to create sql filter for centers
  def product_conditions
    sqlwhere = "1 = 1 "
    sqlwhere = sqlwhere + "and announcements.titlel like ? " if is_string_here?(titlel)
    sqlwhere = sqlwhere + "and announcements.product_id = ? " if is_object_here?(product_id)
    sqlwhere = sqlwhere + "and announcements.announcement_status_id = ? " if is_object_here?(announcement_status_id)
    sqlwhere = sqlwhere + "and announcements.user_id = ? " if is_object_here?(user_id)
    sqlwhere = sqlwhere + "and announcements.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and announcements.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere]
    result << UnicodeUtils.downcase(titlel) if is_string_here?(titlel)
    result << product_id if is_object_here?(product_id)
    result << announcement_status_id if is_object_here?(announcement_status_id)
    result << user_id if is_object_here?(user_id)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end
end
