class PromotionFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :name, :string
  column :title, :string
  column :body, :string
  column :promotion_type_id, :integer
  column :begin_dt, :datetime
  column :finish_dt, :datetime
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :promotion_type


  #
  # Methods to create sql filter for experts
  def conditions
    sqlwhere = "1 = 1 "
    sqlwhere = sqlwhere + "and promotions.name like ? " if is_string_here?(name)
    sqlwhere = sqlwhere + "and promotions.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and promotions.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere]
    result << UnicodeUtils.downcase(name) if is_string_here?(name)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end



end
