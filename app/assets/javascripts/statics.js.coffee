# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $(document).mousemove( (event) ->

    w = $(".page-background").width()
    h = $(".page-background").height()

    cx = w/2
    cy = h/2

    #rubberdX = ( (-(deltaX*deltaX) + divCenterX*2*deltaX ) / (divCenterX*divCenterX) )*(divCenterX)

    #rubberdY = ( (-(deltaY*deltaY) + divCenterY*2*deltaY ) / (divCenterY*divCenterY) )*(divCenterY)


    #$(".page-background").offset({top: event.pageY - cy , left: event.pageX- cx })
  )


$(document).ready(ready)
$(document).on('page:load', ready)