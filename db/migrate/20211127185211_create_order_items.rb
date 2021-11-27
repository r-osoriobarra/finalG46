class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.float :price
      t.references :order, foreign_key: true
      t.references :point, foreign_key: true

      t.timestamps
    end
  end
end
