# == Schema Information
#
# Table name: password_resets
#
#  id         :integer          not null, primary key
#  key        :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_password_resets_on_key      (key) UNIQUE
#  index_password_resets_on_user_id  (user_id)
#

require 'test_helper'

class PasswordResetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
