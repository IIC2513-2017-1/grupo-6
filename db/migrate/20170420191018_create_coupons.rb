class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :kind
      t.integer :discount
      t.integer :redeems_available

      t.timestamps
    end
  end
end
