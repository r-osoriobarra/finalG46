class AddColumnNameToUserCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :user_categories, :name, :integer
  end
end
