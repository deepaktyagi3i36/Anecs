class CreateOpinions < ActiveRecord::Migration
  def self.up
    create_table :opinions do |t|
      t.column :article_id, :integer, :null => false
      t.column :opinion_status_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
      t.column :title, :string, :null => false, :limit => 256
      t.column :body, :string, :null => false, :limit => 4000
      t.column :rating, :integer, :null => false
      t.column :useful, :integer, :null => false
      t.column :useless, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :opinions, :articles, :column => "article_id"
    add_foreign_key :opinions, :opinion_statuses, :column => "opinion_status_id"
    add_foreign_key :opinions, :users, :column => "user_id"


  end

  def self.down
    drop_table :opinions
  end
end
