class ProductsController < ApplicationController

skip_before_action :require_login
  def index
    # @products is an active record not array, which you can add more querry
      @products = Product.order('name')



      for param in %i[search min_price max_price]
        if params[param].present?
          @products = @products.send(param, params[param])
        end
      end

      # if params[:q].present?
      #     @products = @products.search(params[:q])
      # end
    respond_to do |format|
      format.html {}
      format.json { render json: @products }
    end


  end
  def show
      if Product.find(params[:id])
        @product = Product.find(params[:id])
      end
      render layout: 'products'

  end

end