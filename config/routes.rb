Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "/users/login" => "users#login", as: "user_login"
  get "/users/get_sign_in" => "affiliates#get_sign_in", as: "affiliate_get_sign_in"
  get "/affiliates/sign_out" => "affiliates#sign_out", as: "affiliate_sign_out"
  get "/affiliates/sign_up" => "affiliates#sign_up", as: "affiliate_sign_up"
  resources :users
end
