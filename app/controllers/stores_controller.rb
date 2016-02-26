class StoresController < ApplicationController
	before_action :admin_only, only: [:create, :new, :destroy, :edit, :update]

	def index
		@user = current_user
# if there is a search param then show only stores within X distance of search
		if params[:search]
			@stores = Store.within(2, :origin => params[:search])
# if there is no search and no geolocation the show all stores and sort by name
		elsif cookies[:lat_lng].nil?
			all_stores = Store.all
			@stores = all_stores.sort_by {|store| store.name.downcase}
# if there is a geolocation but no search param then sort by distance of geolocation
		else
			lat_lng = cookies[:lat_lng].split("|")
			@stores = Store.all.by_distance(origin: lat_lng)
		end
	end

	def by_brand
		@user = current_user
		stores = Store.all
		brand_name = params[:brand]
		stores_included = []
		stores.each do |store|
			store.brands.each do |brand|
				if brand.name.include?(brand_name)
					stores_included.push(store)
				end
			end
		end
# if there is a search param then show only stores within X distance of search
		if params[:search]
			all_stores_within_search = []
			stores_within_search = Store.within(2, :origin => params[:search])
			stores_included.each do |inc_store|
				stores_within_search.each do |store|
					if store.name.include?(inc_store.name)
						all_stores_within_search.push(store)
					end
				end
			end
			@stores = all_stores_within_search.sort_by{|s| s.name.downcase}
# if there is no search and no geolocation the show all stores and sort by name
		elsif cookies[:lat_lng].nil?
			all_stores = Store.all
			@stores = stores_included.sort_by {|store| store.name.downcase}
# if there is a geolocation but no search param then sort by distance of geolocation
		else
			lat_lng = cookies[:lat_lng].split("|")
			@stores = stores_included.sort_by{|store| store.distance_to(lat_lng)}
		end
		render 'index'
	end

# # if there is no geocode available then show all unsorted
# 		if cookies[:lat_lng].nil?
# 			@stores = stores_included.all
# # if not sort in order of closest to furthest
# 		else
# 			@lat_lng = cookies[:lat_lng].split("|")
# 			@stores = stores_included.sort_by{|s| s.distance_to(@lat_lng)}
# 		end
# 		render :by_brand
# 	end


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
			:description, :address, :ig_url, :ig_url_one, 
			:ig_url_two, :ig_url_three, :ig_url_four, :desc_preview, 
			:phone, {images:[]}, {brand_ids:[]})
	end
end


