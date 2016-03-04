class PostsController < ApplicationController
before_action :admin_only, only: [:create, :new, :destroy, :edit, :update]
before_action :authenticate_user!, only: [:like, :unlike]

protect_from_forgery with: :null_session

	def index
		@user = current_user
		if params[:search]
			@posts = Post.where('name iLIKE ?', "%#{params[:search]}%").order("name DESC")
		else
			@posts = Post.all.sort { |a,b| b.created_at <=> a.created_at }
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
		@comments = @post.comments.all
	end

	def like 
  	@post = Post.find(params[:id])
  	@post.upvote_by current_user
  	@post.save
		render json: @post
		# redirect_to :back
	end

	def unlike
		@post = Post.find(params[:id])
  	@post.unliked_by current_user
  	@post.save
  	render json: @post
  	# redirect_to :back
	end

	private
	def post_params
		params.require(:post).permit(:title, :description, :content, :cover)
	end

end
