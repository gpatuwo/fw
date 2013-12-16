class Outfit < ActiveRecord::Base
	mount_uploader :image, ImageUploader
  validates :description, :gender, :image, :presence => true
  validates :min_temp, :numericality => { :only_integer => true}
end