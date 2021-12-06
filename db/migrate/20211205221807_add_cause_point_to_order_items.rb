class AddCausePointToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :cause_point, foreign_key: true
  end
end
