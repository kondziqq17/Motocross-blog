class PostsController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :home, :show]
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

	def index
	end

	def home
		@posts = Post.reorder("created_at DESC").page(params[:page]).per_page(4)
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

	def upvote
		@post.upvote_from current_user
		redirect_to post_path
	end

	def downvote
		@post.downvote_from current_user
		redirect_to post_path		
	end

	private

		def post_params
			params.require(:post).permit(:title, :description, :image, :delete_image)
		end

		def find_post
			@post = Post.find(params[:id])
		end
end
