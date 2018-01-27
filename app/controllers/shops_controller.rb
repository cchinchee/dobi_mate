class ShopsController < ApplicationController

	def new
	end

	def create
		@shop = Shop.new(shop_params)
		if @shop.save
			redirect_to "/shops/#{@shop.id}"
		else

		redirect_to "/shops/new"
		end
	end
	
	def shop_params
		params.require(:shop).permit(:shop_name, :owner_name, :email, :phone, :address, :city, :state, :postcode)
	end	 
end
