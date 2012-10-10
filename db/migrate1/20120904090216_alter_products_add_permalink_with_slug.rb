class AlterProductsAddPermalinkWithSlug < ActiveRecord::Migration
  def up
    # remove_index :products, :permalink
    remove_column :products, :permalink
    add_column :products, :permalink, :string, :limit => 255, :null => true
    add_column :products, :slug, :string, :limit => 255, :null => true
  end

  def down
    raise "not implemented"
  end
end
