# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  product_id :integer
#
# Indexes
#
#  index_questions_on_product_id  (product_id)
#  index_questions_on_user_id     (user_id)
#

class Question < ApplicationRecord
  validates :content, presence: true, allow_blank: false
  validates :score, presence: true

  belongs_to :user
  belongs_to :product
  has_many :answers, dependent: :destroy
  has_many :question_votes, dependent: :destroy

  has_many :voting_users, through: :question_votes, source: :user

  def score
    question_votes.map(&:delta).sum
  end
end
