# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
applied = false
applied2 = false


isElementVisible = (elementToBeChecked) ->
  TopView = $(window).scrollTop()
  BotView = TopView + $(window).height()
  TopElement = $(elementToBeChecked).offset().top
  BotElement = TopElement + $(elementToBeChecked).height()
  ((BotElement <= BotView) && (TopElement >= TopView))

ready = ->
  $(document).scroll ->
    vertical_scroll = $(document).scrollTop()
    $("#page-section-1 .page-image-background").css "background-position", "center #{vertical_scroll/2}px"

    if vertical_scroll > 100
      if !applied
        $("#nav-bar").attr "id" ,"mini-nav-bar"
        #$("#nav-tabs-container").addClass "scrolled"
        applied = true
      applied2 = false
    else
      if !applied2
        $("#mini-nav-bar").attr "id" ,"nav-bar"
        #$("#nav-tabs-container").removeClass "scrolled"
        applied2 = true
      applied = false

    if $('#page-section-2 .content').is(':visible')
      $("#page-section-2 .left-column").addClass "animated fadeInLeft"
      $("#page-section-2 .right-column").addClass "animated fadeInRight"

    #if $('#page-section-3 .content').is(':visible')
     # $("#page-section-3 h1").addClass "animated fadeInUp"
      #$("#page-section-3 h2").addClass "animated fadeIn"



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