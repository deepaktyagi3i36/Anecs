class CreateRespondents < ActiveRecord::Migration
  def self.up
    create_table :respondents do |t|
      t.column :polling_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :respondents, :pollings, :column => "polling_id"

    # Create indexes
    add_index :respondents, :polling_id
  end

  def self.down
    drop_table :respondents
  end
end
