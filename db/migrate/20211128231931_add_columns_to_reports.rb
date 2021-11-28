class AddColumnsToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :title, :string
    add_column :reports, :description, :string
    add_column :reports, :accomplished, :boolean
  end
end
