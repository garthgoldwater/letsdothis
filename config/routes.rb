Rails.application.routes.draw do
  root "landings#show", as: "/"

  resources :rooms, only: [:create, :show] do
    resources :room_sessions, only: [:new, :create, :destroy]
  end

  # resources :rooms, only: [:show], constraints: SignedInToRoomConstraint.new do
  #   resources :room_sessions, only: [:destroy]
  # end
end
