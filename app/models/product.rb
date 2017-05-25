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
#

class Product < ApplicationRecord
  mount_uploaders :images, ProductImageUploader

  validates :name, presence: true, allow_blank: false
  validates :prize, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :reviews, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :ordered_products, dependent: :destroy
  has_many :product_tags, dependent: :destroy
  has_many :tags, through: :product_tags
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  def add_category; end

  def remove_category; end

  def add_tag; end

  def remove_tag; end

  def average_score
    reviews = self.reviews.map{|x| x.score}
    if reviews.length()>0
      reviews.sum()/reviews.length()
    else
      0
    end
  end
end
