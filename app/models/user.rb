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
end