Rails.application.routes.draw do
  devise_for :users
  root to: "problems#index"
  resources :problems do
    resources :comments, only: :create
  end

  resources :users, only: :show

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
