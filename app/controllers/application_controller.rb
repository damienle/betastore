class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # can use layout here which will apply to entire application
  add_flash_types :success, :info, :warning, :danger

protected
# helper method allow to call method from the view
  helper_method :logged_in?
  def logged_in?
    session[:customer_id].present?
  end

 helper_method def current_customer
     if logged_in?
       @current_customer ||= Customer.find(session[:customer_id])
     end
  end

   def set_current_customer(customer=nil)
     session[:customer_id] = customer.try(:id)
   end

helper_method def cart
      session[:cart] ||= Hash.new(0)
    end

end
