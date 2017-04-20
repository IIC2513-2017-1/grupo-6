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
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  password     :string
#

class User < ApplicationRecord
    has_many :comments
    has_many :reviews
    has_many :questions
    has_many :answers
    has_many :orders
    has_one :cart
end
