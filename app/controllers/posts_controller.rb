class PostsController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :home]

	def index
	end

	def home
		@posts = Post.all.order("created_at DESC")
	end

	def show
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to home_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

		def post_params
			params.require(:post).permit(:title, :description)
		end
end
