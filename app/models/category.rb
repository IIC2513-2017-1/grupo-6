# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#

class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true, allow_blank: false

    has_many :product_categories, dependent: :destroy
    has_many :products, through: :product_categories

    belongs_to :parent, foreign_key: 'parent_id', class_name: 'Category'
    has_many :children, foreign_key: 'parent_id', class_name: 'Category', dependent: :nullify

    has_many :category_coupons, dependent: :destroy
    has_many :coupons, through: :category_coupons

    def extended_children
        ext_children = Set.new
        queue = [self]
        while queue.length > 0
            elem = queue.shift
            ext_children.add(elem)
            queue += elem.children.includes(:children)
        end
        return ext_children
    end
end
