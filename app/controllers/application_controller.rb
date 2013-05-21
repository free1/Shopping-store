class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  include SessionsHelper

  private

  	def current_cart
  		Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
  		cart = Cart.create
  		session[:cart_id] = cart.id
  		cart
  	end

  protected

    def authorize
      redirect_to signin_path, notice: "Please log in" unless signed_in?
    end

end
