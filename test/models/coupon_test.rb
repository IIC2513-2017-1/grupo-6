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
# Indexes
#
#  index_coupons_on_code  (code) UNIQUE
#

require 'test_helper'

class CouponTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
