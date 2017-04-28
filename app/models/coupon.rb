# == Schema Information
#
# Table name: coupons
#
#  id                :integer          not null, primary key
#  code              :string
#  kind              :integer
#  discount          :integer
#  redeems_available :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#



class Coupon < ApplicationRecord
    enum kind: [:percentage, :net] 

    validates :code, presence: true, uniqueness: true, allow_blank: false
    validates :discount, presence: true
    validates :redeems_available, presence: true, numericality: {greater_than_or_equal_to: 0}

    has_many :category_coupons
    has_many :categories, through: :category_coupons 
end
