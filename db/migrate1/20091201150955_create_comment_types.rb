class CreateCommentTypes < ActiveRecord::Migration
  def self.up
    create_table :comment_types do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :comment_types, :name, :unique
    add_index :comment_types, :code, :unique
  end

  def self.down
    drop_table :comment_types
  end
end
