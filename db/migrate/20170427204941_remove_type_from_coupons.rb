class RemoveTypeFromCoupons < ActiveRecord::Migration[5.0]
  def change
    remove_column :coupons, :type, :string
  end
end
