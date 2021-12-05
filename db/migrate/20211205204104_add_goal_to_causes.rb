class AddGoalToCauses < ActiveRecord::Migration[5.2]
  def change
    add_column :causes, :goal, :integer
  end
end
