class CustomerMailer < ActionMailer::Base


  default from: "support@mysterious-wildwood-2634.herokuapp.com"


  def confirm_email(customer)

    @name = customer.email.split('@').first
    # @password = params[:customer][:password]
    @token = Rails.application.message_verifier('customer').generate(customer.id)

    # mail to: user.email
    # mail to: "checking@gmail.com"
    mail(to: customer.email, subject: 'Welcome to new BetaStore Site')






  end
end
