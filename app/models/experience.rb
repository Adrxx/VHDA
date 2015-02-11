class Experience < ActiveRecord::Base

	has_many :photos
	
 	accepts_nested_attributes_for :photos, :allow_destroy => true

 	validates :title, presence: true
 	validates :description, presence: true


end
