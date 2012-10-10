class BookcaseFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :article_id, :integer
  column :product_id, :integer
  column :annotation, :string
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :article
  belongs_to :product

end
