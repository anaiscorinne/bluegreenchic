class BlogpostsController < ApplicationController
		before_action :admin_only, only: [:create, :new, :destroy, :edit, :update]

	def index
		@user = current_user
		if params[:search]
			@posts = BlogPost.where('name iLIKE ?', "%#{params[:search]}%").order("name DESC")
		else
			@posts = BlogPost.all
		end
  end

	def new
		@user = current_user
		@post = BlogPost.new
	end

	def create
		@post = BlogPost.new(blogpost_params)
			if @post.save
				redirect_to blogposts_path
			else
				render :new
			end
	end

	def edit
		@post = BlogPost.find_by(id: params[:id])
		render 'edit'
	end

	def update
		@post = BlogPost.find_by(id: params[:id])
		
			if @post.update_attributes(blogpost_params)
					@post.save
				redirect_to blogposts_path
			else
				render :edit
			end
	end

	def destroy
		@post = BlogPost.find(params[:id])
		@post.destroy
		redirect_to blogposts_path
	end

	def show
		@user = current_user
		@post = BlogPost.find(params[:id])
		render 'show'
	end


	private
	def blogpost_params
		params.require(:blogpost).permit(:title, :description, 
			:date, :content, :image)
	end
	
end

