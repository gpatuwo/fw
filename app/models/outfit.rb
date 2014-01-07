class Outfit < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	validates :description, :gender, :image, :presence => true
	validates :min_temp, :max_temp, :numericality => { :only_integer => true}
	
	belongs_to :user
	
	def self.search_for (query)
    Outfit.where("min_temp >= :query AND max_temp <= :query", :query =>"#{query}")
	end  
end