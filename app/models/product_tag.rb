# == Schema Information
#
# Table name: product_tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_id     :integer
#  product_id :integer
#
# Indexes
#
#  index_product_tags_on_product_id  (product_id)
#  index_product_tags_on_tag_id      (tag_id)
#

class ProductTag < ApplicationRecord
    belongs_to :product
    belongs_to :tag
end
