# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  email        :string
#  username     :string
#  name         :string
#  last_name    :string
#  address      :string
#  phone_number :string
#  is_admin     :boolean
#  password     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
