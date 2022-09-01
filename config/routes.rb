Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists do
    resources :bookmarks, only: [ :new, :create ]
  end
  # Don’t nest an action if you can access the resource with its id
  resources :bookmarks, only: :destroy
end
