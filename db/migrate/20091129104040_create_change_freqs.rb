class CreateChangeFreqs < ActiveRecord::Migration
  def self.up
    create_table :change_freqs do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :change_freqs, :name, :unique
    add_index :change_freqs, :code, :unique
  end

  def self.down
    drop_table :change_freqs
  end
end
