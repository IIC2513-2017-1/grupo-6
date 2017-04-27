class CreateOrderedProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :ordered_products do |t|
      t.integer :quantity
      t.timestamps
    end

    add_reference :ordered_products, :order, foreign_key: true
    add_reference :ordered_products, :product, foreign_key: true

    add_index :ordered_products, [:order_id, :product_id], unique: true

  end
end
