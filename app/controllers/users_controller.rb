class UsersController < ApplicationController
	before_action :authorize_user, only: [:show, :edit]

end
