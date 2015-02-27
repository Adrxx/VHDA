# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
appliedMiniBar = false
appliedNormalBar = false

appliedGif1 = false

smoothScrollTo = ->
  $('a[href*=#]:not([href=#])').click ->
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname)
      target = $(this.hash)
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']')
      if (target.length)
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 8000)
        return false

ready = ->
  #smoothScrollTo()
  $(document).scroll ->
    vertical_scroll = $(document).scrollTop()

    width = $( window ).width()
    parallax = width > 400

    if parallax 
      $("#page-section-1 .page-image-background").css "background-position", "center #{vertical_scroll/2}px"
      $("#page-section-3 .page-image-background").css "background-position", "center #{vertical_scroll/2}px"

    if vertical_scroll > 100
      if !appliedMiniBar
        $("#nav-bar").attr "id" ,"mini-nav-bar"
        #$("#nav-tabs-container").addClass "scrolled"
        appliedMiniBar = true
      appliedNormalBar = false
    else
      if !appliedNormalBar
        $("#mini-nav-bar").attr "id" ,"nav-bar"
        #$("#nav-tabs-container").removeClass "scrolled"
        appliedNormalBar = true
      appliedMiniBar = false

    #console.log "v:: " + vertical_scroll
    #console.log "o:: " + $("#page-section-2").height()/2

    if vertical_scroll > $("#page-section-2 .left-column").offset().top -  $("#page-section-2 .left-column").height()/2
      if !appliedGif1
        console.log "adsahdas"
        #$("#page-section-2 .animated-image").css "background-image" , "url(/assets/ds.gif)"
        $("#page-section-2 .animated-image").css "background-image" , "url(/assets/puente.gif?#{Math.random()})"
        appliedGif1 = true

      #$("#page-section-2 .left-column").addClass "animated fadeInLeft"
      #$("#page-section-2 .right-column").addClass "animated fadeInRight"

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