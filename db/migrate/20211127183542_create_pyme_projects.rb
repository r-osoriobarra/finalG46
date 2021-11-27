class CreatePymeProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :pyme_projects do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.string :photo_logo
      t.string :industry
      t.string :website
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
