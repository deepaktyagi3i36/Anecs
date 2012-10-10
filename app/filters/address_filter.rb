class AddressFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :name, :string
  column :code, :string
  column :about, :string
  column :created_at_since, :datetime
  column :created_at_till, :datetime
end
