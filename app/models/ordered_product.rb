# == Schema Information
#
# Table name: ordered_products
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#  product_id :integer
#  prize      :integer
#
# Indexes
#
#  index_ordered_products_on_order_id                 (order_id)
#  index_ordered_products_on_order_id_and_product_id  (order_id,product_id) UNIQUE
#  index_ordered_products_on_product_id               (product_id)
#

class OrderedProduct < ApplicationRecord
  
  validates :prize, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :order
  belongs_to :product
end
