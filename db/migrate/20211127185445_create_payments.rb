class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :state
      t.float :total
      t.string :token
      t.references :order, foreign_key: true
      t.references :payment_method, foreign_key: true

      t.timestamps
    end
  end
end
