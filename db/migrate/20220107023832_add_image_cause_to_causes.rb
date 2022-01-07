class AddImageCauseToCauses < ActiveRecord::Migration[5.2]
  def change
    add_column :causes, :cause_img, :string
  end
end
