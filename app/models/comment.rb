# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  review_id  :integer
#
# Indexes
#
#  index_comments_on_review_id  (review_id)
#  index_comments_on_user_id    (user_id)
#

class Comment < ApplicationRecord
    validates :content, presence: true, allow_blank: false

    belongs_to :user 
    belongs_to :review
end
