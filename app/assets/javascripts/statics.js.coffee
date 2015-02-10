# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
applied = false

ready = ->
  $(document).scroll ->
    vertical_scroll = $(document).scrollTop()
    $("#page-section-1 .page-image-background").css "background-position", "0px #{vertical_scroll/2}px"

    if vertical_scroll > 1
      if !applied
        $("#nav-bar").attr "id" ,"mini-nav-bar"
        $("#ribbon").addClass "scrolled"
        applied = true
    else
      $("#mini-nav-bar").attr "id" ,"nav-bar"
      $("#ribbon").removeClass "scrolled"
      applied = false

    if $('#page-section-2 .content').is(':visible')
      $("#page-section-2 .content").addClass "animated fadeIn"


  $(document).mousemove (event) ->

    w = $(".page-background").width()
    h = $(".page-background").height()

    cx = w/2
    cy = h/2

    #rubberdX = ( (-(deltaX*deltaX) + divCenterX*2*deltaX ) / (divCenterX*divCenterX) )*(divCenterX)

    #rubberdY = ( (-(deltaY*deltaY) + divCenterY*2*deltaY ) / (divCenterY*divCenterY) )*(divCenterY)


    #$(".page-background").offset({top: event.pageY - cy , left: event.pageX- cx })


$(document).ready(ready)
$(document).on('page:load', ready)