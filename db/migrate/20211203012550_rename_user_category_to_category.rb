class RenameUserCategoryToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_categories, :categories
  end
end
