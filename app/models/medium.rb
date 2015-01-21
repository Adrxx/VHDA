class Medium < ActiveRecord::Base

	belongs_to :experience

	has_attached_file :file

	do_not_validate_attachment_file_type :file
	
end
