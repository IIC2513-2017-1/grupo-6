# == Schema Information
#
# Table name: question_votes
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  question_id :integer
#  delta       :integer
#
# Indexes
#
#  index_question_votes_on_question_id  (question_id)
#  index_question_votes_on_user_id      (user_id)
#

class QuestionVote < ApplicationRecord
  validates :delta, inclusion: { in: [-1, 1] }
  validates :user_id, uniqueness: { scope: :question_id }

  belongs_to :user
  belongs_to :question
end
