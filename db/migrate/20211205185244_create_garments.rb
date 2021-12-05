class CreateGarments < ActiveRecord::Migration[6.1]
  def change
    create_table :garments do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :color
      t.string :image
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
