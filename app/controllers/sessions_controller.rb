class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      sign_in user
  		redirect_to admin_url
  	else
  		render 'new'
  	end
  end

  def destroy
    sign_out
    redirect_to store_url, notice: "Logged out"
  end
end
