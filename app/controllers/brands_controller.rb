class BrandsController < ApplicationController
	before_action :admin_only, only: [:create, :new, :destroy, :edit, :update, :show]
	
	def index
		@user = current_user
		@keyvalues = Keyvalue.all 
		if params[:search]
			@brands = Brand.where('name iLIKE ?', "%#{params[:search]}%").order("name DESC")
		else
			@brands = Brand.all
		end
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

	def edit
		@brand = Brand.find_by(id: params[:id])
		render 'edit'
	end

	def update
		@brand = Brand.find_by(id: params[:id])
		
			if @brand.update_attributes(brand_params)
					@brand.save
				redirect_to brands_path
			else
				render :edit
			end
	end

	def destroy
		@brand = Brand.find(params[:id])
		@brand.destroy
		redirect_to brands_path
	end

	def like 
  	@brand = Brand.find(params[:id])
  	@brand.upvote_by current_user
  	@brand.save
		render json: @brand
		# redirect_to :back
	end

	def unlike
		@brand = Brand.find(params[:id])
  	@brand.unliked_by current_user
  	@brand.save
  	render json: @brand
  	# redirect_to :back
	end


	private
	def brand_params
		params.require(:brand).permit(:name, :description, 
			:website, :instagram, :image, :facebook, :twitter, keyvalue_ids:[])
	end
	
end
























