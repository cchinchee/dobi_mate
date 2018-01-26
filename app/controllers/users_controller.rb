class UsersController < ApplicationController


	def new

	end 

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user_id
			redirect_to "/users/#{@user_id}"
		else
			render "/users/new"
		end	
	end 

	def login
		@user = User.find_by(email: params[:email])
		if @user != nil && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			redirect_to "/"
		end	
	end 

	private
	def user_params
		params.require(:user).permit(:name, :password, :email, :users_avatar)
	end

end

