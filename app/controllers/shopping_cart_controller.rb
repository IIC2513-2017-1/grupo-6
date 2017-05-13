class ShoppingCartController < ApplicationController
  before_action :set_cart

  def add_item
    pid = cart_params[:product_id]
    p cart_params
    @cart[pid] = (@cart[pid] || 0) + cart_params[:quantity]
    flash[:notice] = 'This product was successfully added to your Shopping Cart'
    redirect_back(fallback_location: root_path)
  end

  def remove_item
    @cart.delete(cart_params[:product_id])
    flash[:notice] = 'The item was successfully removed from your Shopping Cart'
    redirect_back(fallback_location: root_path)
  end

  def adjust_quantity
    @cart[cart_params[:product_id]] = cart_params[:quantity]
    flash[:notice] = 'Your Shopping Cart has been updated successfuly'
    redirect_back(fallback_location: root_path)
  end

  def show
    @products = Product.find(@cart.keys).map do |p|
      [p, @cart[p.id.to_s]]
    end
  end

  private

  def set_cart
    @cart = session['cart'] ||= {}
  end

  def cart_params
    parameters = params.require(:cart).permit(:product_id, :quantity)
    parameters[:quantity] = parameters[:quantity].to_i
    parameters
  end
end
