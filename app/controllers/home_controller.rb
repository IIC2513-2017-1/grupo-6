class HomeController < ApplicationController
  def index
    products = Product.all.includes(:tags).includes(:categories).select{|x| x.tags.map{|tag| tag.id}.include?(1)}
    @products_category = products.group_by{|x| x.root_category}
  end

  def dashboard
    return unless authenticated_admin?
    @answers = Answer.all
    @categories = Category.all
    @comments = Comment.all
    @orders = Order.all.includes(ordered_products: [product: :categories]).order('id ASC')
    @questions = Question.all
    @reviews = Review.all
    @tags = Tag.all
    @users = User.all
    @coupons = Coupon.all
    
    @last_orders = @orders.where('created_at > ?', 30.days.ago).to_a   
    @cats = @categories.map{ |category| [category.name, []] }.to_h
    amount_sold = 0
    @cats.keys.each do |cat|
      amount_sold = 0
      (Date.today-30.days).upto(Date.today) do |date|
        amount_sold = 0
        @created_orders = @last_orders.reject {|x| x.created_at < date.beginning_of_day || x.created_at > date.end_of_day}
        @created_orders.each do |o|
          ordered_product = o.ordered_products
          ordered_product.each do |o_product|
            if o_product.product.categories.map{|c| c.name}.include?(cat)
              quantity = o_product.quantity
              price = o_product.product.prize
              amount_sold = amount_sold + quantity*price                       
            end
          end
        end
        @cats[cat].push(amount_sold)
      end    
    end

    @pie_data = @cats.map{ |key, value| {name: key, y: value.reduce(0, :+)} }
    @line_data = @cats.map{ |key, value| {name: key, data: value} }

    @total_orders = @orders.to_a   
    @total_cats = @categories.map{ |category| [category.name, []] }.to_h
    amount_sold = 0
    @total_cats.keys.each do |cat|
      amount_sold = 0
        amount_sold = 0
        @created_orders = @total_orders
        @created_orders.each do |o|
          ordered_product = o.ordered_products
          ordered_product.each do |o_product|
            if o_product.product.categories.map{|c| c.name}.include?(cat)
              quantity = o_product.quantity
              price = o_product.product.prize
              amount_sold = amount_sold + quantity*price                       
            end
          end
        end
        @total_cats[cat].push(amount_sold)
    end
    @col_data = @total_cats.map{ |key, value| {name: key, y: value.reduce(0, :+)} }


  end
  

  
end
