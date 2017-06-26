module Api::V1
  class ProductsController < ApiController
    before_action :authenticate
    
    def index
      @products = Product.all
    end

    def show
      @product = Product.includes(:reviews, :questions).find(params[:id])
    end
  end
end
