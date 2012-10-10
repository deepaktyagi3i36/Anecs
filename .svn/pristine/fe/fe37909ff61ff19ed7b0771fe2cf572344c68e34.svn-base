class AlterProductsRebuildSlug < ActiveRecord::Migration
  def up
    # Migrate
    Product.build_ancestry_from_parent_ids!
    Product.check_ancestry_integrity!

    # Remove parent id column
    remove_foreign_key :products, :column => "parent_id"
    remove_column :products, :parent_id
    remove_foreign_key :products, :column => "root_id"
    remove_column :products, :root_id

    # Iterate
    Product.find(:all).each do |product|
      if product.permalink.nil? || category.permalink.blank?
        product.permalink = product.name
        product.slug = product.permalink
        product.save!
      else
        product.slug = product.permalink
        product.save!
      end
    end
  end

  def down
    raise "not implemented"
  end
end
