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
  enum status: %i[pending_payment processing shipped completed canceled returned]

  belongs_to :user
  has_many :ordered_products, dependent: :destroy
  has_many :products, through: :ordered_products, source: :product

  def total_cost
    ordered_products.map { |x| x.quantity * x.prize }.sum
  end
end
