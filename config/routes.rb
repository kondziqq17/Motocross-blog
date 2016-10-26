Rails.application.routes.draw do

  devise_for :users
	root "posts#index"

	resources :posts do
		resources :comments
		member do
			put "like" => "posts#upvote"
			put "unlike" => "posts#downvote"
		
	end
end

	get '/home', to: 'posts#home'
	get '/posts/:id/:title' => 'posts#show', :as => :post_with_title
	get '/about', to: 'pages#about'

end
