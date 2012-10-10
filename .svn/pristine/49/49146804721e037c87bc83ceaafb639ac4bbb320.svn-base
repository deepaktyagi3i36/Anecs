class AlterManpagesRebuildSlug < ActiveRecord::Migration
  def up
    # Migrate
    Manpage.build_ancestry_from_parent_ids!
    Manpage.check_ancestry_integrity!

    # Remove parent id column
    remove_foreign_key :manpages, :column => "parent_id"
    remove_column :manpages, :parent_id

    # Iterate
    Manpage.find(:all).each do |manpage|
      if manpage.permalink.nil? || manpage.permalink.blank?
        manpage.permalink = manpage.name
        manpage.slug = manpage.permalink
        manpage.save!
      else
        manpage.slug = manpage.permalink
        manpage.save!
      end
    end
  end

  def down
    raise "not implemented"
  end
end
