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

class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true, allow_blank: false

    has_many :product_categories
    has_many :products, through: :product_categories

    belongs_to :parent, foreign_key: 'parent_id', class_name: 'Category'
    has_many :children, foreign_key: 'parent_id', class_name: 'Category'
end
