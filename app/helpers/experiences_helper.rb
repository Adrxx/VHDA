module ExperiencesHelper


  def iframe_from_experience(exp)
    iframe = ""
    unless exp.sphere.nil?
      str1_markerstring = "<iframe"
      str2_markerstring = "</iframe>"
      theres_iframe = exp.sphere[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
      iframe = exp.sphere.strip unless theres_iframe.nil?
    end

    if iframe.empty?
      style = "<style> .gallery-top{ height:85% !important; } .iframe-container{ display:none; } </style>"
    else
      style = "<style> .gallery-top{ height:45% !important; } .iframe-container{ height:40%;!important } </style>"
      iframe.strip!
      style = style + iframe      
    end
    style.html_safe
  end

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
