class CreateUserTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_types do |t|
      t.integer :name

      t.timestamps
    end
  end
end
