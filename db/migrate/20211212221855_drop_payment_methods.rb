class DropPaymentMethods < ActiveRecord::Migration[5.2]
  def change
    drop_table :payment_methods
  end
end
