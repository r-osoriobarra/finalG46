class RemoveProfilePhotoFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profile_photo, :string
  end
end
