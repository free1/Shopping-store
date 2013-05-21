class UsersController < ApplicationController

  def index
    @users = User.order(:name)
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save
  		redirect_to users_url, 
  			notice: "User #{@user.name} was successfully created."
  	else
  		render 'new'
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])

  	if @user.update_attributes(params[:user])
  		redirect_to users_url,
  			notice: "User #{user.name} was successfully updated."
  	else
  		render 'edit'
  	end
  end

  def destroy
    @user = User.find(params[:id])
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end
    
      redirect_to users_url
  end

end
