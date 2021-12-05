class RenameGoalFromCausePoints < ActiveRecord::Migration[5.2]
  def change
    rename_column :cause_points, :goal, :stock
  end
end
