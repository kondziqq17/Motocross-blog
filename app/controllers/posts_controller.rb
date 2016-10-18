class PostsController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :home]
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
	end

	def home
		@posts = Post.all.order("created_at DESC")
		@posts = Post.paginate(page: params[:page], per_page: 4)
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
		unless current_user == @post.user
			redirect_to(@post, notice: "Nie możesz edytować tego postu")
		end
	end

	def update
		if @post.update(post_params)
			redirect_to post_path
		else
			render 'edit'
		end
	end

	def destroy
		if @post.destroy
			redirect_to home_path
		end
	end

	private

		def post_params
			params.require(:post).permit(:title, :description)
		end

		def find_post
			@post = Post.find(params[:id])
		end
end
