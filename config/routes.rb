Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #reviews/:id
  resources :restaurants do
   collection do
    #nao precisa de id
    # restaurants/top
    get :top
   end
   member do
    # precisa de id
    # restaurants/:id/chef
    get :chef
   end
   # restaurants/:id/reviews
   resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: :destroy
end
