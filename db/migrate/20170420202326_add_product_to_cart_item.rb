class AddProductToCartItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :cart_items, :product, foreign_key: true
  end
end
