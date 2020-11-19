class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :quality_rating
      t.integer :security_rating
      t.integer :fun_rating
      t.references :toy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
