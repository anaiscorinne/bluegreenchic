class KeyvaluesApiController < ApplicationController
	protect_from_forgery with: :null_session

	def index
		keyvalues = Keyvalue.all
		render json: keyvalues
	end

	def show
		keyvalue = Keyvalue.find_by(id: params[:id])
		brands = keyvalue.brands.all
		unless keyvalue
			render json: {error: "Keyvalue does not found"},
			status: 404
			return
		end
		render json: keyvalue.to_json({:include => :brands})
	end
end
