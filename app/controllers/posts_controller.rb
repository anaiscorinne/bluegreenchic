class PostsController < ApplicationController
before_action :admin_only, only: [:create, :new, :destroy, :edit, :update]

	def index
		@user = current_user
		if params[:search]
			@posts = Post.where('name iLIKE ?', "%#{params[:search]}%").order("name DESC")
		else
			@posts = Post.all
		end
  end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
			if @post.save
				redirect_to posts_path
			else
				render :new
			end
	end

	def edit
		@post = Post.find_by(id: params[:id])
		render 'edit'
	end

	def update
		@post = Post.find_by(id: params[:id])
		
			if @post.update_attributes(post_params)
					@post.save
				redirect_to posts_path
			else
				render :edit
			end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	def show
		@user = current_user
		@post = Post.find_by(id: params[:id])
	end


	private
	def post_params
		params.require(:post).permit(:title, :description, :content, :cover)
	end

end
