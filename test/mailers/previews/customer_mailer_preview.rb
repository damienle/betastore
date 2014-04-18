# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview
  def Other

   CustomerMailer.confirm_email(Customer.last)

  end
end
