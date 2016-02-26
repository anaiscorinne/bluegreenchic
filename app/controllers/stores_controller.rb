class StoresController < ApplicationController
	before_action :admin_only, only: [:create, :new, :destroy, :edit, :update]

	def index
		@user = current_user
# if there is a search param then show only stores within X distance of search
		if params[:search]
			@stores = Store.within(2, :origin => params[:search])
# if there is no search and no geolocation the show all stores and sort by name
		elsif params[:Search_by_name]

			@stores = Store.search_by_name(params[:search_by_name]).order("name DESC")
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
		stores.each do |store| #for all stores, take each store
			store.brands.each do |brand| # and look through each brand
				if brand.name.include?(brand_name) #if store brand is same as the params brand
					stores_included.push(store) #then push the store to array of stores that have them
				end
			end
		end
# if search param show only stores within X dist. of search that inc the brand searched
		if params[:search]
			all_stores_within_search = []
			stores_within_search = Store.within(2, :origin => params[:search]) #all stores w/in dist
			stores_included.each do |inc_store| #in array of stores that have brand take each inc_store
				stores_within_search.each do |store| #for each store within search
					if store.name.include?(inc_store.name) #if store is also inc_store
						all_stores_within_search.push(store) #then add store to array of inc store within search
					end
				end
			end
			# stores equal all w/ brand w/in search and sort by name ASC
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


