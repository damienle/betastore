class Admin::LoginController < ApplicationController
    layout 'admin'

  def new

  end
  def create
      user = User.find_by_email(params[:email])
      # user = User.find_by(email: params[:email]) is a hash
    if user.try(:authenticate, params[:password])
    # if user.try(:password) == params[:password]
      # user.password == params[:password]
      session[:user_id] = user.id
      redirect_to admin_products_path
    else
      flash.now[:danger] = 'Log In Failed'
      render 'new'
    end

    # if params[:password] == 'secret'
    #   session[:logged_in_email] = params[:email]
    #   redirect_to admin_products_path
    # else

    #   render 'new'
    # end
  end
end
