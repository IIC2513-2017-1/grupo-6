# == Schema Information
#
# Table name: coupons
#
#  id                :integer          not null, primary key
#  code              :string
#  type              :string
#  discount          :integer
#  redeems_available :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Coupon < ApplicationRecord
end
