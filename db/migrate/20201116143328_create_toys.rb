class CreateToys < ActiveRecord::Migration[6.0]
  def change
    create_table :toys do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :photo
      t.integer :unit_price
      # t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
