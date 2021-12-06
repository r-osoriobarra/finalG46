class RemovePointIdFromOrderItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :point_id
  end
end
