class OutfitsController < ApplicationController
	def index
		@outfits = Outfit.all
	end

	def new
		@outfit = Outfit.new
	end

	def create
		@outfit = Outfit.new(params.require(:outfit).permit(:description, :min_temp, :max_temp, :gender, :url, :image))
		# @outfit.description = params[:outfit][:description]
		# @outfit.description = params[:outfit][:]
		if @outfit.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@outfit = Outfit.find params[:id]
	end

	private
	def safe_movie_params
		return params.require(:outfit).permit(:description, :min_temp, :max_temp, :gender, :url, :image)
	end
end
