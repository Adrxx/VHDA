class Experience < ActiveRecord::Base

	has_many :media
	
 	accepts_nested_attributes_for :media

 	validates :title, presence: true
 	validates :description, presence: true


end
