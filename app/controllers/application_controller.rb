class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end
  helper_method :current_user

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end
  helper_method :logged_in?
  
  # a convenient method to set the session to given user's id with the `:user_id` key
  def sign_in(user)
    session[:user_id] = user.id
  end

  # clears the session by setting the value of `:user_id` key to `nil`
  def sign_out
    session[:user_id] = nil
  end

  def current_shop
    if session[:shop_id]
      @current_shop ||= Shop.find_by_id(session[:shop_id])
    end
  end
  helper_method :current_shop


  def shop_logged_in?
    !current_shop.nil?
  end
  helper_method :shop_logged_in?
  
  # a convenient method to set the session to given user's id with the `:user_id` key
  def sign_in(user)
    session[:shop_id] = shop.id
  end

  # clears the session by setting the value of `:user_id` key to `nil`
  def sign_out
    session[:shop_id] = nil
  end


  def cities
      render json: CS.cities(params[:state], :my).to_json
  end
end