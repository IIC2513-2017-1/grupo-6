class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticated_admin?, only:[:index, :create, :edit, :update, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @ordered_products = OrderedProduct.includes(:product).where(order_id: @order.id)
    @total = @ordered_products.map{|o| o.product.prize * o.quantity }.sum()
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    return unless logged_user?
    @order = Order.new(order_params)
    @order.user_id = current_user.id

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order_id = @order.id
    @order.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  def create_from_cart
    if not logged_user? and session['cart'] and session['cart'].values.any? {|x| x>0}
      flash[:alert] = "There has been an error processing your order"
      redirect_to root_path
      return
    end
    @order = Order.create(user_id: current_user.id, status: :pending_payment)
    @cart = session['cart']
    @cart.each do |pid, quantity|
      OrderedProduct.create(product_id: pid, quantity: quantity, order_id: @order.id)
    end
    @cart.clear()
    flash[:notice] = "Your order was successfully created. Payment pending."
    redirect_to @order
  end

  def user_orders
    @orders = Order.where(user_id: params[:id])
    render 'index'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:status)
    end
end
