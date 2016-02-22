class BrandsController < ApplicationController
	before_action :admin_only, only: [:create, :new, :destroy, :edit]

	def index
		@brands = Brand.all 
	end

	def new
		@brand = Brand.new
	end

	def create
		@brand = Brand.new(brand_params)
			if @brand.save
				link_to brands_path
			else
				render :new
			end
	end

	def destroy
	end

	private
	def brand_params
		params.require(:brand).permit(:name, :description, :website, :instagram)
end
























