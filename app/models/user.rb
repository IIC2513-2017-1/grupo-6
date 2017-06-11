# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  username        :string
#  name            :string
#  last_name       :string
#  address         :string
#  phone_number    :string
#  is_admin        :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  avatar          :string
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#

class User < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    has_secure_password

    validates :password, presence: {on: :create}, length: { minimum: 6 },
                        allow_blank: {on: :update}
    validates :email, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :username, presence: true, uniqueness: true, length: {minimum: 2}
    validates :phone_number, allow_blank: true, format: /\A\+?\d{8,11}\z/i

    has_many :comments, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :questions, dependent: :destroy
    has_many :answers, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :question_votes, dependent: :destroy
    has_many :voted_questions, through: :question_votes, source: :question
    has_many :answer_votes, dependent: :destroy
    has_many :voted_answers, through: :answer_votes, source: :answer

end
