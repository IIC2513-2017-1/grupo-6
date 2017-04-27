# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  status     :integer
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#

class Order < ApplicationRecord

    enum status: [:processing, :shipped, :completed, :canceled, :returned]

    belongs_to :user
end
