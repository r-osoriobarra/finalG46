class RemovePhotoLogoFromPymeProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :pyme_projects, :photo_logo, :string
  end
end
