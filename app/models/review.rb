# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  content    :text
#  score      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  product_id :integer
#
# Indexes
#
#  index_reviews_on_product_id              (product_id)
#  index_reviews_on_user_id                 (user_id)
#  index_reviews_on_user_id_and_product_id  (user_id,product_id) UNIQUE
#

class Review < ApplicationRecord
    validates :content, presence: true, allow_blank: false
    validates :user_id, uniqueness: {scope: :product_id}
    validates :score, numericality: {greater_than_or_equal_to: 0, lower_than_or_equal_to: 5}
    
    belongs_to :user
    belongs_to :product
    has_many :comments, dependent: :destroy
end
