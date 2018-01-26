class UsersController < ApplicationController
	

	def new

	end 

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			render "/users/new"
		end	
	end 

	def login
		@user = User.find_by(email: params[:session][:email])
		if @user != nil && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id

			redirect_to "/users/#{@user.id}"
		else
			render root_path
		end
	end

	def log_out
		session.clear
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :password, :email, :users_avatar)
	end

end

