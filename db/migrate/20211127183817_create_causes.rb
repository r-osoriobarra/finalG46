class CreateCauses < ActiveRecord::Migration[5.2]
  def change
    create_table :causes do |t|
      t.string :title
      t.string :story
      t.date :start_date
      t.date :end_date
      t.string :reward
      t.references :pyme_project, foreign_key: true

      t.timestamps
    end
  end
end
