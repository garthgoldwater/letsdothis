Rails.application.routes.draw do
  root "landings#show"
  resources :rooms, only: [:create, :show]
end
