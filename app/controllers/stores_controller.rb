class StoresController < ApplicationController
	before_action :admin_only, only: [:create, :new, :destroy, :edit, :update]

	def index
		@stores = Store.all 
		@user = current_user
	end

	def show
		@store = Store.find_by(id: params[:id])
	end

	def new
		@store = Store.new
	end

	def create
		@store = Store.new(store_params)
			if @store.save
				redirect_to stores_path
			else
				render :new
			end
	end

	def edit
		@store = Store.find_by(id: params[:id])
		render 'edit'
	end

	def update
		@store = Store.find_by(id: params[:id])
			if @store.update_attributes(store_params)
				@store.save
				redirect_to stores_path
			else
				render :edit
			end
	end

	def destroy
		@store = Store.find(params[:id])
		@store.destroy
		redirect_to stores_path
	end

	private
	def store_params
		params.require(:store).permit(:name, :website, :instagram, 
			:description, :address, :image, :ig_url, :ig_url_one, 
			:ig_url_two, :ig_url_three, :ig_url_four, :desc_preview, :phone, brand_ids:[])
	end
end


