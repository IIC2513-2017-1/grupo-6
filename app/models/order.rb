# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  date       :datetime
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#

class Order < ApplicationRecord
    belongs_to :user
end
