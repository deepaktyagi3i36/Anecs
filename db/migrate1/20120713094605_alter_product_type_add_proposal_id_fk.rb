class AlterProductTypeAddProposalIdFk < ActiveRecord::Migration
  def up
    # Add foreign keys
    add_foreign_key :product_types, :proposals, :column => "proposal_id"
  end

  def down
    remove_foreign_key :product_types, :column => "proposal_id"
  end
end
