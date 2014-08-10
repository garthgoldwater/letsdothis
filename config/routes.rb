Rails.application.routes.draw do
  root "landings#show"

  resources :rooms, only: [:create, :show] do
    resource :room_session, only: [:new, :create, :destroy]
    resources :messages, only: [:create]
    resources :topics, only: [:create, :show]
  end

  resources :topics, only: [:show] do
    resources :messages, only: [:create]
    resources :topics, only: [:create, :show]
  end
end
