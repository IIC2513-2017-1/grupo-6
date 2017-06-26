module Api::V1
  class OrdersController < ApiController
    before_action :authenticate

    def index
      @orders = @current_user.orders.includes(:ordered_products).all
    end

    def show
      @order = Order.includes(ordered_products: :product).find(params[:id])
      if @order.user != @current_user
        render json: { error: "You're not authorized to access this content." }, status: :forbidden
        return
      end
    end

    def create
      @order = Order.new(user_id: @current_user.id, status: :pending_payment)
      real_prizes = Product.all.map{ |x| [x.id, x.real_prize] }.to_h
      params[:order][:products].each do |product|
        @order.ordered_products << OrderedProduct.new(product_id: product[:id], quantity: product[:quantity], prize: real_prizes[product[:id].to_i])
      end

      if @order.save
        render 'api/v1/orders/show'
      else
        render json: { errors: @order.errors }, status: :unprocessable_enitity
      end
    end
  end
end
