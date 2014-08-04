Rails.application.routes.draw do
  root "landings#show"

  resources :rooms, only: [:create, :show] do
    resources :room_sessions, only: [:new, :create, :destroy]
  end
end
