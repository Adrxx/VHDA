class Experience < ActiveRecord::Base

	has_many :media
	
 	accepts_nested_attributes_for :media

end
