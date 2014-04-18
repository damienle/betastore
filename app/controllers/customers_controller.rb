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

      redirect_to @customer, notice: "Customer #{@customer.id} was created"
      UserMailer.welcome(Customer.last).deliver
    else
      render 'new'
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
       redirect_to products_path, notice: 'Your account is confirmed'
     else
       redirect_to sign_up_path, alert: 'The verification link is invalid'
     end
  end

  private
    def customer_params
       params.require(:customer).permit(:name, :email, :password)
    end
end
