class DropProposals < ActiveRecord::Migration
  def self.up
    remove_foreign_key :categories, :column => "proposal_id"
    remove_column :categories, :proposal_id

    # remove_foreign_key :properties, :column => "proposal_id"
    remove_column :properties, :proposal_id

    remove_foreign_key :product_types, :column => "proposal_id"
    remove_column :product_types, :proposal_id

    remove_foreign_key :products, :column => "proposal_id"
    remove_column :products, :proposal_id

    drop_table :proposals
  end

  def self.down
    raise "not implemented"
  end
end

