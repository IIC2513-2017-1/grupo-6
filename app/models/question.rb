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
#  score      :integer
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
    has_many :answers
    has_many :question_votes

    has_many :voting_users, through: :question_votes, source: :user

end
