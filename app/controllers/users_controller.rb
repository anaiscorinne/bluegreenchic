class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]
	before_action :admin_only, only: [:index, :destroy]

	def show
		@user = User.find_by(id: params[:id])
		if current_user && current_user.id == @user.id
			render :show
		else
			redirect_to "/"
		end
	end

end
