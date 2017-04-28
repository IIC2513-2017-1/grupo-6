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

    has_many :product_categories
    has_many :products, through: :product_categories

    belongs_to :parent, foreign_key: 'parent_id', class_name: 'Category'
    has_many :children, foreign_key: 'parent_id', class_name: 'Category'

    has_many :category_coupons
    has_many :coupons, through: :category_coupons
end
