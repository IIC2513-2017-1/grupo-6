# == Schema Information
#
# Table name: answer_votes
#
#  id         :integer          not null, primary key
#  delta      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  answer_id  :integer
#
# Indexes
#
#  index_answer_votes_on_answer_id              (answer_id)
#  index_answer_votes_on_user_id                (user_id)
#  index_answer_votes_on_user_id_and_answer_id  (user_id,answer_id) UNIQUE
#

class AnswerVote < ApplicationRecord
  validates :delta, inclusion: { in: [-1, 1] }
  validates :user_id, uniqueness: { scope: :answer_id }

  belongs_to :user
  belongs_to :answer
end
