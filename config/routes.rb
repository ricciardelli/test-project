Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :broadcasts, only: :index do
    resources :subscriptions, only: [:create]
  end
end
