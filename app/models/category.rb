# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true, allow_blank: false

    has_many :product_categories
    has_many :products, through: :product_categories
end
