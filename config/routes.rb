Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'home#index'
  end

  unauthenticated :user do
    root 'home#unregistered'
  end

  resources :pics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
