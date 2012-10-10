class FeedbackFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :title, :string
  column :user_id, :integer
  column :contact_type_id, :integer
  column :contact_status_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :user
  belongs_to :contact_type
  belongs_to :contact_status


  #
  # Methods to create sql filter for experts
  def conditions
    # TODO: addd filter by _id
    sqlwhere = "1 = 1 "
    sqlwhere = sqlwhere + "and feedbacks.title like ? " if is_string_here?(title)
    sqlwhere = sqlwhere + "and feedbacks.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and feedbacks.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere]
    result << UnicodeUtils.downcase(title) if is_string_here?(title)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end



end
