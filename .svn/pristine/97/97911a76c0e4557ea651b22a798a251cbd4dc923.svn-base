class CreateTimetables < ActiveRecord::Migration
  def self.up
    create_table :timetables do |t|
      t.column :product_id, :integer, :null => false
      t.column :timetable_status_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
      t.column :name, :string, :null => false
      t.column :about, :string, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :timetables, :products, :column => "product_id"
    add_foreign_key :timetables, :timetable_statuses, :column => "timetable_status_id"
    add_foreign_key :timetables, :users, :column => "user_id"

    # Create indexes
    add_index :timetables, [:product_id, :name], :unique

  end

  def self.down
    drop_table :timetables
  end
end
