class ShopsController < ApplicationController
	before_action :find_shop, only: [:show, :edit, :update]


	def new
	end

	def create
		@shop = Shop.new(shop_params)
		if @shop.save
			session[:shop_id] = @shop.id
			redirect_to "/shops/#{@shop.id}"
		else

		redirect_to "/shops/new"
		end
	end

	def update
		if current_shop.id == @shop.id
			@shop.update(shop_params)
			redirect_to "/shops/#{@shop_id}", :flash => { :success => "Details updated!"}
		else
		
		redirect_to "/shops/#{@shop_id}/edit"
		end	

	end 


	def show
		@hash = Gmaps4rails.build_markers(@shop) do |shop, marker|
		    marker.lat shop.latitude
		    marker.lng shop.longitude
		end
	end

	def login
		@shop = Shop.find_by(email: params[:session][:email])
		if @shop != nil && @shop.authenticate(params[:session][:password])
			session[:shop_id] = @shop.id

			redirect_to "/shops/#{@shop.id}"
		else
			render root_path
		end
	end

	def logout
		session.clear
		redirect_to root_path
	end 
	
	def shop_params
		params.require(:shop).permit(:shop_name, :owner_name, :email, :phone, :address, :city, :state, :postcode, :password)
	end

	def find_shop
		@shop = Shop.find_by(id: params[:id])
	end	 
end
