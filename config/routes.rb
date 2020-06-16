Rails.application.routes.draw do
  resources :categories do
    resources :products
  end
  get '/products', to: 'products#all_products'
end
