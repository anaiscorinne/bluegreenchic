class BlogpostsController < ApplicationController
		before_action :admin_only, only: [:create, :destroy, :edit]

	def index
		@posts = Blogpost.all
	end

	def show
	end

	def new
	end

	def create
	end

	def destroy
	end

	def edit
	end

end
