# == Schema Information
#
# Table name: category_coupons
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  coupon_id   :integer
#
# Indexes
#
#  index_category_coupons_on_category_id  (category_id)
#  index_category_coupons_on_coupon_id    (coupon_id)
#

require 'test_helper'

class CategoryCouponTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
