class ProductsController < ApplicationController

  def index
      @products = Product.order('name').all
  end
  def show
      if Product.find(params[:id])
        @product = Product.find(params[:id])
      end
      render layout: 'products'

  end

end