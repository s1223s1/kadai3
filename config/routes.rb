Rails.application.routes.draw do
  devise_for :users
resources :books
	root 'homes#top'
	resources :users, only: [:show, :edit, :update]
end

