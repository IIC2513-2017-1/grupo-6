class CreateCategoryCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :category_coupons do |t|

      t.timestamps
    end
    add_reference :category_coupons, :category, foreign_key: true
    add_reference :category_coupons, :coupon, foreign_key: true
  end
end
