Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :users

  resources :groups, only: %i[create index new show] do
    resources :entities, only: %i[create index new show]
  end
end
