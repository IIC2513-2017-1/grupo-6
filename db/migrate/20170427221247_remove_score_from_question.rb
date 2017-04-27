class RemoveScoreFromQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :score, :integer
  end
end
