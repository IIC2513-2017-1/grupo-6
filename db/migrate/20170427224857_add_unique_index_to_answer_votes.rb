class AddUniqueIndexToAnswerVotes < ActiveRecord::Migration[5.0]
  def change
    add_index :answer_votes, [:user_id, :answer_id], unique: true
  end
end
