Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'
  # Defines the root path route ("/")
  # root "articles#index"
end
