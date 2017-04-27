class CreateAnswerVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_votes do |t|
      t.integer :delta
      t.timestamps
    end
    add_reference :answer_votes, :user, foreign_key: true
    add_reference :answer_votes, :answer, foreign_key: true
  end
end
