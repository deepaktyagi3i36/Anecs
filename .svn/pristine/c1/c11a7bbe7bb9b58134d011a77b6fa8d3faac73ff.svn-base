class AlterManpagesAddPermalinkWithSlug < ActiveRecord::Migration
  def up
    #remove_column :manpages, :permalink
    add_column :manpages, :permalink, :string, :limit => 255, :null => true
    add_column :manpages, :slug, :string, :limit => 255, :null => true
  end

  def down
    raise "not implemented"
  end
end
