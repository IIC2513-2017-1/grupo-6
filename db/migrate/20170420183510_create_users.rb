class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.boolean :is_admin
      t.string :password

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
