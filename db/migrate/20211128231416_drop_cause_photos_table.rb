class DropCausePhotosTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :cause_photos
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
