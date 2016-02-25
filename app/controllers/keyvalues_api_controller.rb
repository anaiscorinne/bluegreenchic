class KeyvaluesApiController < ApplicationController
	protect_from_forgery with: :null_session

	def index

		if params[:valueIds].nil? || params[:valueIds].empty?
			brands= Brand.all
		else
			brands = Brand.joins(:keybrands)
				.where(:keybrands => { :keyvalue_id => params[:valueIds] })
				.select("brands.*, COUNT(keyvalue_id)")
				.group("brands.id")
				.having("COUNT(keyvalue_id) >= ?", params[:valueIds].length)
		end

		render json: brands
	end

end
