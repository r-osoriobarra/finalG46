class RenamePymeProjectToProject < ActiveRecord::Migration[5.2]
  def change
    rename_table :pyme_projects, :projects
  end
end
