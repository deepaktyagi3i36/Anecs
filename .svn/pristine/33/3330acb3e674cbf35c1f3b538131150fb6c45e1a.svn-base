class AlterProductsAddWeightAlterRating < ActiveRecord::Migration
  def up
    remove_column :products, :user_rating
    remove_column :products, :expert_rating
    add_column :products, :rating, :decimal, :null => false, :default => 0
    add_column :products, :weight, :integer, :null => false, :default => 0
  end

  def down
    raise "not implemented"
  end
end
