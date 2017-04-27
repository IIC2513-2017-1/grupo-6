# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  email        :string
#  username     :string
#  name         :string
#  last_name    :string
#  address      :string
#  phone_number :string
#  is_admin     :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  password     :string
#

class User < ApplicationRecord
    validates :password, presence: true, length: { minimum: 6 },
                        confirmation: true, allow_blank: false
    validates :email, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :username, presence: true, uniqueness: true, length: {minimum: 2}
    
    has_many :comments
    has_many :reviews
    has_many :questions
    has_many :answers
    has_many :orders
    has_many :question_votes
    has_many :voted_questions, through: :question_votes, source: :question
    has_many :answer_votes
    has_many :voted_answers, through: :answer_votes, source: :answer

end
