class CustomersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      # CustomerMailer.confirm_email(@customer).deliver
      redirect_to products_path, notice: "Account \# #{@customer.id} created"

    else
       flash.now[:danger] = 'Email or Name have been taken'
       render 'new'
      #render 'new', notice: "Duplicate account"
    end
    # Customer.create!(name: 'Damien', email: 'me@yahoo.com')
  end

  def show
    @customer = Customer.find(params[:id])

  end

  def update
  end
  def check
     customer = Customer.verify(params[:token])

     if customer
       # TODO: set_current_customer(customer)
       set_current_customer(customer)
       redirect_to products_path
     else
       redirect_to sign_up_path, alert: 'The verification link is invalid'
     end
  end

  private
    def customer_params
       params.require(:customer).permit(:name, :email, :password)
    end
end
