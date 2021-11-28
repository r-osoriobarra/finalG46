class RemoveNameFromUserCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_categories, :name, :string
  end
end
