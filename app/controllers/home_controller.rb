class HomeController < ApplicationController
  def index
    @products = Product.order(:id)[0..3]
  end
end
