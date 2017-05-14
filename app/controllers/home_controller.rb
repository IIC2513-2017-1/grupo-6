class HomeController < ApplicationController
  def index
    @products = Product.order("RANDOM()")[0..3]
  end
end
