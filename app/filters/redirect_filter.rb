class RedirectFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :priority, :string
  column :pattern, :string
  column :created_at_since, :datetime
  column :created_at_till, :datetime


  #
  # Methods to create sql filter for centers
  def conditions
    return []
  end

end
