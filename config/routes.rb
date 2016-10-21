Rails.application.routes.draw do

  devise_for :users
	root "posts#index"

	resources :posts do
		resources :comments
	end

	get '/home' => 'posts#home'
	get '/posts/:id/:title' => 'posts#show', :as => :post_with_title

end
