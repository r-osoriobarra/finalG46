class AddColumnNameToPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :points, :name, :integer
  end
end
