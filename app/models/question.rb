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
    belongs_to :user
    belongs_to :product
    has_many :answers
end
