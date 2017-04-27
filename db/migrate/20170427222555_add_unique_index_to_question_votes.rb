class AddUniqueIndexToQuestionVotes < ActiveRecord::Migration[5.0]
  def change
    add_index :question_votes, [:user_id, :question_id], unique: true
  end
end
