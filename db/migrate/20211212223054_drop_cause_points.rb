class DropCausePoints < ActiveRecord::Migration[5.2]
  def change
    drop_table :cause_points
  end
end
