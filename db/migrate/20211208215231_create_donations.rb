class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.string :title
      t.string :message
      t.integer :status
      t.string :code
      t.string :payment_url 

      t.timestamps
    end
  end
end
  