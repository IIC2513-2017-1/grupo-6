# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
    validates :name, presence: true, allow_blank: false, uniqueness: true

    has_many :product_tags, dependent: :destroy
    has_many :products, through: :product_tags
end
