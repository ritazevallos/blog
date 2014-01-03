class RemoveParentidFromCategories < ActiveRecord::Migration
  def change
    remove_column :category, :parent_id
  end
end
