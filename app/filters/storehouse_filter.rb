class StorehouseFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :name, :string
  column :region_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :region

  #
  # Methods to create sql filter for centers
  def conditions
    []
  end

end
