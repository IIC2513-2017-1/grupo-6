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
#  images      :json
#  discount    :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
