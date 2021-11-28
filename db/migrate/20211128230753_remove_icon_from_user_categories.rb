class RemoveIconFromUserCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_categories, :icon, :string
  end
end
