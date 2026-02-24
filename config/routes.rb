Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  

  resources :categories, except: [:show]
  resources :products, path: '/'
  # get "/products", to: 'products#index' # this may be the login page in the future (modify as needed)
  get 'categories/:category_id/products', to: 'products#index', as: 'category_products'

  
end
