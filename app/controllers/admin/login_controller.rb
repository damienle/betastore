class Admin::LoginController < ApplicationController
    layout 'admin'

  def new

  end
  def create
    if params[:password] == 'secret'
      session[:logged_in_email] = params[:email]
      redirect_to admin_products_path
    else
      flash.now[:danger] = 'Log In Failed'
      render 'new'
    end
  end
end
