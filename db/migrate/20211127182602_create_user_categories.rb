class CreateUserCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :user_categories do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
