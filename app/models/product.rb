# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  details     :text
#  prize       :integer
#  stock       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord

    validates :name, presence: true, allow_blank: false
    validates :prize, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :stock, presence: true, numericality: {greater_than_or_equal_to: 0}

    has_many :reviews
    has_many :questions
    has_many :ordered_products
end
