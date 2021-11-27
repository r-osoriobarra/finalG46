class CreateCausePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :cause_photos do |t|
      t.string :cause_photo
      t.references :cause, foreign_key: true

      t.timestamps
    end
  end
end
