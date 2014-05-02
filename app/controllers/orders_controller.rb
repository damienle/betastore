class OrdersController < ApplicationController
  def new
     @order = Order.from_cart(cart)
  end

  def create
  end

  def show
  end
end
