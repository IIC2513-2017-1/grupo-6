class CreateQuestionVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :question_votes do |t|
      t.timestamps
    end
    add_reference :question_votes, :user, foreign_key: true
    add_reference :question_votes, :question, foreign_key: true
  end
end
