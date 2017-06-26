class AddPrizeToOrderedProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :ordered_products, :prize, :integer
  end
end
