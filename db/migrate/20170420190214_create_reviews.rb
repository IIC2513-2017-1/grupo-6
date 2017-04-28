class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.float :score

      t.timestamps
    end
    add_reference :reviews, :user, foreign_key: true
    add_reference :reviews, :product, foreign_key: true
    add_index :reviews, [:user_id, :product_id], unique: true
  end
end
