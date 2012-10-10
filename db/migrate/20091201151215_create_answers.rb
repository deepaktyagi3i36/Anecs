class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.column :polling_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :answers, :pollings, :column => "polling_id"

    # Create indexes
    add_index :answers, :polling_id

  end

  def self.down
    drop_table :answers
  end
end
