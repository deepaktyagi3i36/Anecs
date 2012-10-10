class PhotoFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :product_id, :integer
  column :photo_file_name, :string
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :product

  #
  def conditions(website)
    sqlwhere = "products.website_id = ? "
    sqlwhere = sqlwhere + "and photos.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and photos.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere, website.id]
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

end



