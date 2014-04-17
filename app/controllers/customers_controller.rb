class CustomersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def create
    @customer = Customer.new(params.require(:customer).permit(:name, :email))
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
end
