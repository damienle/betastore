class LoginsController < ApplicationController
  def new


  end

  def create
      customer = Customer.find_by_email(params[:email])
      # user = User.find_by(email: params[:email]) is a hash
    if customer.try(:authenticate, params[:password])
    # if user.try(:password) == params[:password]
      # user.password == params[:password]
      session[:customer_id] = customer.id
      redirect_to products_path
    else
      flash.now[:danger] = 'Log In Failed'
      render 'new'
    end


  end

  def destroy
    session[:customer_id] = nil
    redirect_to :back
  end
end
