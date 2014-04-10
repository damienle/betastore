class Admin::ProductsController < ApplicationController

   layout 'admin'

  def index
    if logged_in?
      @products = Product.order('name')
    else
      redirect_to admin_login_path, alert: 'Please log in to continue'
      # render layout: 'admin'
    end
  end
  def show
      if Product.find(params[:id])
        @product = Product.find(params[:id])
      end
  end
  def new
  @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit!)
    if @product.save
      redirect_to admin_products_path, notice: "Product #{@product.id} was created"
    else
      render 'new'
    end
  end

  def edit
    if Product.find(params[:id])
        @product = Product.find(params[:id])
    end

  end

  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit!)
    redirect_to admin_products_path, notice: "Product #{@product.id} is updated"
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
        # redirect_to admin_products_path, notice: "Product #{@product.id} is deleted"
    # else
    #   render 'show'
    # end
  end

protected
  def logged_in?
    false
  end

end


