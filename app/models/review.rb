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
#  index_reviews_on_product_id  (product_id)
#  index_reviews_on_user_id     (user_id)
#

class Review < ApplicationRecord
    validates :content, presence: true, allow_blank: false
    
    belongs_to :user
    belongs_to :product
    has_many :comments
end
