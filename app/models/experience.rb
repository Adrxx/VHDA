class Experience < ActiveRecord::Base

	has_many :media
	
 	accepts_nested_attributes_for :media, :reject_if => :all_blank, :allow_destroy => true

 	validates :title, presence: true
 	validates :description, presence: true


end
