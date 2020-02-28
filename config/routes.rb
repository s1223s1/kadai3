Rails.application.routes.draw do
  devise_for :users
resources :books
	root 'homes#top'
	resources :users, only: [:index, :show, :edit, :update, :destroy]
	get "homes/about"
end

