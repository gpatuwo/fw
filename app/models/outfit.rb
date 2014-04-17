class Outfit < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	validates :description, :gender, :image, :presence => true
	validates :min_temp, :max_temp, :numericality => { :only_integer => true}
	
	belongs_to :user
	
	def self.search_for (temp, gender)
    Outfit.where("max_temp >= :temp AND min_temp <= :temp AND gender = :gender", :temp =>"#{temp}", :gender => "#{gender}")
	end  
end