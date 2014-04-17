class OutfitsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

	def index
		@selected_gender = params[:gender]
		@temperature = 555

		response = Net::HTTP.get_response("api.openweathermap.org","/data/2.5/weather?q=san%20francisco")

		response = JSON.parse(response.body)
		temperature_kelvin = response["main"]["temp"] 
		@temperature = (9/5) * ( temperature_kelvin - 273) + 32

		if params[:temperature].present? && params[:gender].present?
			@outfits = Outfit.search_for(params[:temperature], params[:gender])
		else
			@outfits = Outfit.all.order("updated_at DESC")
		end
	end

	def show
		@outfit = Outfit.find params[:id]
	end

	def new
		@outfit = Outfit.new
	end

	def create
		@outfit = Outfit.new(params.require(:outfit).permit(:description, :min_temp, :max_temp, :gender, :url, :image))
		# @outfit.description = params[:outfit][:description]
		# @outfit.description = params[:outfit][:]

		@outfit.user = current_user
		
		if @outfit.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@outfit = Outfit.find(params[:id])
	end

	def update
		if 
			@outfit = Outfit.find(params[:id])
			@outfit.update(safe_outfit_params)
			redirect_to @outfit
		else
			render :edit
		end
	end

	def destroy
		@outfit = Outfit.find(params[:id])
		@outfit.destroy
		redirect_to root_path
	end

	private
	def safe_outfit_params
		return params.require(:outfit).permit(:description, :min_temp, :max_temp, :gender, :url, :image)
	end
end
