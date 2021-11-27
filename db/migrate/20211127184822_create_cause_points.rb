class CreateCausePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :cause_points do |t|
      t.integer :goal
      t.references :cause, foreign_key: true
      t.references :point, foreign_key: true

      t.timestamps
    end
  end
end
