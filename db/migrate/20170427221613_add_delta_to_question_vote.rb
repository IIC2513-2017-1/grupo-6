class AddDeltaToQuestionVote < ActiveRecord::Migration[5.0]
  def change
    add_column :question_votes, :delta, :integer
  end
end
