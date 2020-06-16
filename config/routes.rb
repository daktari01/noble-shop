Rails.application.routes.draw do
  resources :subtypes do
    resources :options
  end
  resources :categories do
    resources :products
  end
  get '/products', to: 'products#all_products'
end
