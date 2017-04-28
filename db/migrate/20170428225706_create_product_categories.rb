class CreateProductCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :product_categories do |t|

      t.timestamps
    end
    add_reference :product_categories, :category, foreign_key: true
    add_reference :product_categories, :product, foreign_key: true
  end
end
