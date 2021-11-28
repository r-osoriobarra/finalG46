class RemoveNameFromPoints < ActiveRecord::Migration[5.2]
  def change
    remove_column :points, :name, :string
  end
end
