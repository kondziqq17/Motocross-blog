Rails.application.routes.draw do

  devise_for :users
	root "posts#index"

	resources :posts

	get '/home' => 'posts#home'
	get '/posts/:id/:title' => 'posts#show', :as => :post_with_title
	match '/contacts',     to: 'contacts#new', via: 'get'
	resources "contacts", only: [:new, :create]
end
