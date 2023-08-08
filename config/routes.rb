Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
  unauthenticated do
    root "splash_screen#index", as: :unauthenticated_root
  end
  # root "splash_screen#index"
  resources :categories, only: [:index, :new, :show, :create] do
    resources :items, only: [:index, :new, :create]
  end
end
