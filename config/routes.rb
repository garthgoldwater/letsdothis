Rails.application.routes.draw do
  root "landings#show"

  resources :rooms, only: [:create, :show] do
    resource :room_session, only: [:new, :create, :destroy]
    resources :messages, only: [:create]
    resources :topics, only: [:create, :show] do
      resource :document, only: [:create]
    end
  end

  resources :topics, only: [:show, :update] do
    resources :messages, only: [:create]
    resources :topics, only: [:create]
    resource :document, only: [:create, :update]
  end
end
