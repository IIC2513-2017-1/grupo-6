class HomeController < ApplicationController
  def index
    @products = Product.order(:id)[0..3]
  end

  def dashboard
    return unless authenticated_admin?
    @answers = Answer.all
    @categories = Category.all
    @comments = Comment.all
    @orders = Order.all
    @questions = Question.all
    @reviews = Review.all
    @tags = Tag.all
    @users = User.all
    @coupons = Coupon.all
  end
  
end
