class CreatePasswordResets < ActiveRecord::Migration[5.0]
  def change
    create_table :password_resets do |t|
      t.string :key
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :password_resets, :key, unique: true
    
  end
end
