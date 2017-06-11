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

    @last_orders = @orders.where('created_at > ?', 29.days.ago)
    
    @cats = @categories.map{ |category| [category.name, []] }.to_h
    amount_sold = 0
    @cats.keys.each do |cat|
      amount_sold = 0
      (Date.today-30.days).upto(Date.today) do |date|
        amount_sold = 0
        created_orders = @last_orders.where(created_at: date.midnight..date.end_of_day)
        created_orders.each do |o|
          ordered_product = o.ordered_products

          ordered_product.each do |o_product|
            quantity = o_product.quantity
            price = o_product.product.prize
            if o_product.product.categories.map{|c| c.name}.include?(cat)
              amount_sold = amount_sold + quantity*price                        
            end
          end
        end
        @cats[cat].push(amount_sold)
      end    
    end

    @pie_data = @cats.map{ |key, value| {name: key, y: value.reduce(0, :+)} }
    @line_data = @cats.map{ |key, value| {name: key, data: value} }

  end
  

  
end
