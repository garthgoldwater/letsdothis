Rails.application.routes.draw do
  root "landings#show"

  resources :rooms, only: [:create, :show] do
    resource :room_session, only: [:new, :create, :destroy]
  end
end
