class UserMailer < ActionMailer::Base
  default from: "support@mysterious-wildwood-2634.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(cust)
    @customer = cust
    @name = cust.email.split('@').first
    # @password = params[:customer][:password]
    @token = Rails.application.message_verifier('customer').generate(cust.id)

    # mail to: user.email
    # mail to: "checking@gmail.com"
    mail(to: @customer.email, subject: 'Welcome to new BetaStore Site')





    # @greeting = "Hi"

    # mail to: "to@example.org"
  end
end
