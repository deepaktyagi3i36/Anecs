class InventoryFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :product_id, :integer
  column :variant_id, :integer
  column :storehouse_id, :integer
  column :quantity_since, :integer
  column :quantity_till, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :storehouse
  belongs_to :product
  belongs_to :variant


end
