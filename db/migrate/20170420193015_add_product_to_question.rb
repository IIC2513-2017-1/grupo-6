class AddProductToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :product, foreign_key: true
  end
end
