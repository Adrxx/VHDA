module ExperiencesHelper

	def echo_spacers(number)
		result = ''
		number.times { result+='<div class="spacer"></div>' }
		result.html_safe
	end

	def animation_options(flash)
		if flash.empty?
			'animated fadeIn'
		else
			''
		end
	end

end
