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
    has_many :reviews
    has_many :questions
    has_many :cart_items
end
