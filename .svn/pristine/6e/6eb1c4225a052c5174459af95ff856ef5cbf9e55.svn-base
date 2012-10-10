class CommentFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :titlel
  column :product_id, :integer
  column :comment_type_id, :integer
  column :comment_status_id, :integer
  column :user_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :product
  belongs_to :comment_type
  belongs_to :comment_status
  belongs_to :user

end
