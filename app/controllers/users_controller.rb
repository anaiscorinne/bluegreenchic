class UsersController < ApplicationController
	before_action :authorize_user, only: [:show, :edit]
	before_action :admin_only, only: [:index, :destroy]

end
