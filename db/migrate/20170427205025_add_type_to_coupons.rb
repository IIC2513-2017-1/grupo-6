class AddTypeToCoupons < ActiveRecord::Migration[5.0]
  def change
    add_column :coupons, :type, :integer
  end
end
