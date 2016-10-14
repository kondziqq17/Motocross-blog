class PostsController < ApplicationController
	before_filter :authenticate_user!, except: [:index]

	def index
	end

	def home
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
