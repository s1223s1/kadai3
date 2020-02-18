Rails.application.routes.draw do
resources :todolists
	root 'homes#top'

end
