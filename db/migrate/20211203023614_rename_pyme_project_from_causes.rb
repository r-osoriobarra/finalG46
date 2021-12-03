class RenamePymeProjectFromCauses < ActiveRecord::Migration[5.2]
  def change
    rename_column :causes, :pyme_project_id, :project_id
  end
end
