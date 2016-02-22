class KeyvaluesController < ApplicationController
	before_action :admin_only, only: [:create, :destroy, :edit]
end
