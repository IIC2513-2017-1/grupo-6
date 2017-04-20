class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :details
      t.integer :prize
      t.integer :stock

      t.timestamps
    end
  end
end
