class CartsController < ApplicationController
  def create
      add_to_cart(params[:product_id])
      redirect_to cart_path, info: "product #{params[:product_id]} was added"
  end

  def show
      @order = Order.from_cart(cart)
      @order.calculate_totals
  end

protected

protected
 #   def cart
 # set default value of hash to zero for any keys, return cart hash
 #     session[:cart] ||= Hash.new(0)
 #   end

   def add_to_cart(product_id)
  # increase by one, use to_i because we use to_params
     cart[product_id.to_i] += 1
   end


end
