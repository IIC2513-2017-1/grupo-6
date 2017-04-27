class AddScoreToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :score, :integer
  end
end
