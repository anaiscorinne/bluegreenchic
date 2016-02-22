class BrandsController < ApplicationController
	before_action :admin_only, only: [:create, :new, :destroy, :edit, :show]

	def index
		@brands = Brand.all 
	end

	def new
		@brand = Brand.new
	end

	def create
		@brand = Brand.new(brand_params)
			if @brand.save
				redirect_to brands_path
			else
				render :new
			end
	end

	def show
		@brand = Brand.find_by(id: params[:id])
		render 'show'
	end

	def destroy
		Brand.find(params[:id]).destroy
		redirect_to brands_path
	end

	private
	def brand_params
		params.require(:brand).permit(:name, :description, :website, :instagram)
	end
end
























