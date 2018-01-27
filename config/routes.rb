Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get 'cities/:state', to: 'application#cities'
  post "/users/login" => "users#login", as: "user_login"
  
  get "/users/log_out" => "users#log_out", as: "users_log_out"
  get "/affiliates/sign_up" => "affiliates#sign_up", as: "affiliate_sign_up"
  resources :users


  post "/shops/login" => "shops#login", as: "shop_login"
  resources :shops

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
