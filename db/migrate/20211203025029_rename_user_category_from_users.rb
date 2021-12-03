class RenameUserCategoryFromUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_category_id, :category_id
  end
end
