class AddPointReferencesToDonations < ActiveRecord::Migration[5.2]
  def change
    add_reference :donations, :point, foreign_key: true
  end
end
