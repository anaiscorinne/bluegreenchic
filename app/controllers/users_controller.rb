class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]
	before_action :admin_only, only: [:index, :destroy]

	def show
		@user = User.find_by(id: params[:id])
		@liked_posts = @user.get_voted Post
		@liked_stores = @user.get_voted Store
		@liked_brands = @user.get_voted Brand

		if current_user && current_user.id == @user.id
			render :show
		else
			redirect_to "/"
		end
	end

end
