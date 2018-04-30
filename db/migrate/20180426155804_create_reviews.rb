class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :review, null: false
      t.integer :rating, null: false
      t.references :chef, index: true, foreign_key: { to_table: :users}, null: false
      t.references :customer, index: true, foreign_key: { to_table: :users}, null: false

      t.timestamps
    end
  end
end
