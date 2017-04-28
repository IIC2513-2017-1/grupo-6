class CreateProductTags < ActiveRecord::Migration[5.0]
  def change
    create_table :product_tags do |t|

      t.timestamps
    end
    add_reference :product_tags, :tag, foreign_key: true
    add_reference :product_tags, :product, foreign_key: true
  end
end
