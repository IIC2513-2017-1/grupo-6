# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#  user_id     :integer
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#  index_answers_on_user_id      (user_id)
#

class Answer < ApplicationRecord
  validates :content, presence: true, allow_blank: false
  validates :score, presence: true

  belongs_to :question
  belongs_to :user

  has_many :answer_votes, dependent: :destroy

  has_many :voting_users, through: :answer_votes, source: :user

  def score
    answer_votes.map(&:delta).sum
  end
end
