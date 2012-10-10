# == Schema Information
#
# Table name: tableless31_models
#
#  center_id :integer
#  expert_id :integer
#

class AddToFavoriteForm < Tableless31Model
  # ::Rails.logger.error("...")

  column :center_id, :integer
  column :expert_id, :integer

end
