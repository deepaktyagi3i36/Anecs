class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.column :timetable_id, :integer, :null => false
      t.column :begin_dt, :datetime, :null => false
      t.column :finish_dt, :datetime, :null => false
      t.column :monday, :string, :limit => 256, :null => true
      t.column :tuesday, :string, :limit => 256, :null => true
      t.column :wednesday, :string, :limit => 256, :null => true
      t.column :thursday, :string, :limit => 256, :null => true
      t.column :friday, :string, :limit => 256, :null => true
      t.column :saturday, :string, :limit => 256, :null => true
      t.column :sunday, :string, :limit => 256, :null => true
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :schedules, :timetables, :column => "timetable_id"

    # Create indexes
    add_index :schedules, :timetable_id

  end

  def self.down
    drop_table :schedules
  end
end
