class UsersController < ApplicationController
  
	def new
	  @user = User.new
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	    redirect_to root_url, :notice => "Signed up! Now you can login with ur email and password."
	  else
	    render "new"
	  end
	end

	def user_params
		params.require(:user).permit(:name,:email,:password,:is_admin)
	end


end
