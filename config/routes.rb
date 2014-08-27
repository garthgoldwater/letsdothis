Rails.application.routes.draw do
  root "landings#show"

  resources :groups, only: [:create, :show] do
    resource :group_session, only: [:new, :create, :destroy]
    resources :documents, only: [:create, :new, :show]
  end

  resources :documents, only: [] do
    resources :messages, only: [:create]
    resources :documents, only: [:create]
  end
end
