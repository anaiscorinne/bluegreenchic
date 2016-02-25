class KeyvaluesController < ApplicationController
	before_action :admin_only, only: [:create, :new, :destroy, :edit, :update, :show]

	def index
		@keyvalues = Keyvalue.all 
		@user = current_user
	end

	def show
		@keyvalue = Keyvalue.find_by(id: params[:id])
	end

	def new
		@keyvalue = Keyvalue.new
	end

	def create
		@keyvalue = Keyvalue.new(keyvalue_params)
			if @keyvalue.save
				redirect_to stores_path
			else
				render :new
			end
	end

	def edit
		@keyvalue = Keyvalue.find_by(id: params[:id])
		render 'edit'
	end

	def update
		@keyvalue = Keyvalue.find_by(id: params[:id])
			if @keyvalue.update_attributes(keyvalue_params)
				@keyvalue.save
				redirect_to brands_path
			else
				render :edit
			end
	end

	def destroy
		@keyvalue = keyvalue.find(params[:id])
		@keyvalue.destroy
		redirect_to stores_path
	end

	private
	def keyvalue_params
		params.require(:keyvalue).permit(:name, :description, :icon)
	end
end

