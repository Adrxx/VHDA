# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
appliedMiniBar = false
appliedNormalBar = false

appliedGif1 = false

canvas = 0
upperLineL = 0
upperLineR = 0
middleLine = 0
lowerLineL = 0
lowerLineR = 0
ul = 0
ur = 0
m = 0
ll = 0
lr = 0
group = 0
active = false

animateMenu = (time) ->
  if !active
    upperLineL.animate( {transform: ul}, time)
    upperLineR.animate( {transform: ur}, time)
    middleLine.animate( {transform: m, opacity: 1}, time) 
    lowerLineL.animate( {transform: ll}, time)
    lowerLineR.animate( {transform: lr}, time)
    $('#nav-tabs-container-mobile').show()
    #$('#nav-tabs-container-mobile').animate({
    #opacity: 1,
    #top: "+=50",
    #}, 5000)

    active= true
  else
    noMatrix = new Snap.Matrix()
    time = time /3
    upperLineL.animate( { transform: noMatrix} , time)
    upperLineR.animate( { transform: noMatrix} , time)
    middleLine.animate( { transform: noMatrix,opacity: 1} , time) 
    lowerLineL.animate( { transform: noMatrix} , time)
    lowerLineR.animate( { transform: noMatrix} , time)
    #$('#nav-tabs-container-mobile').addClass "animated fadeOutUp"
    $('#nav-tabs-container-mobile').hide()


    active= false



generateMenu = ->
  #console.log 'porqui'
  lineWidth = 2
  gapBetween = 11
  width = 28
  height = lineWidth*3 + gapBetween*2
  $('#nav-button').width width
  $('#nav-button').height height
  $('#nav-tabs-container-mobile').hide()
  canvas = Snap('#nav-button')
  upperLineL = canvas.rect(0,0,width/2,lineWidth)
  upperLineR = canvas.rect(width/2,0,width/2,lineWidth)
  middleLine = canvas.rect(0,lineWidth+gapBetween,width,lineWidth)
  lowerLineL = canvas.rect(0,lineWidth*2+gapBetween*2,width/2,lineWidth)
  lowerLineR = canvas.rect(width/2,lineWidth*2+gapBetween*2,width/2,lineWidth)
  group = canvas.g(upperLineL,upperLineR,middleLine,lowerLineL,lowerLineR)
  group.attr {fill:"#72bcc9"}

  ul = new Snap.Matrix() 
  ul.translate(4,4) 
  ul.rotate(45, lineWidth/2, lineWidth/2); 

  ur = new Snap.Matrix() 
  ur.translate(-4,4) 
  ur.rotate(-45, width-lineWidth/2, lineWidth/2); 

  m = new Snap.Matrix() 
  m.rotate(45, height/2, height/2); 

  ll = new Snap.Matrix() 
  ll.translate(4,-4) 
  ll.rotate(-45, lineWidth/2, height-lineWidth/2); 

  lr = new Snap.Matrix() 
  lr.translate(-4,-4) 
  lr.rotate(45, width-lineWidth/2, height-lineWidth/2);

  $('#nav-button').on "click", ->
    animateMenu(300)




ready = ->
  generateMenu()
  $('a[href*=#]:not([href=#])').on "click", () ->
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname)
      target = $(this.hash);
      #console.log target
      #target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length)
        console.log "porqyi"
        $('html,body').animate({ scrollTop: target.offset().top }, 1000);
      

  $('#arrow').on "click", ->
    
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

    if vertical_scroll > $("#page-section-2 .left-column").offset().top -  $("#page-section-2 .left-column").height()/2
      if !appliedGif1
        #console.log "adsahdas"
        #$("#page-section-2 .animated-image").css "background-image" , "url(/assets/ds.gif)"
        $("#page-section-2 .left-column .animated-image").css "background-image" , "url(/assets/animacion1.gif?#{Math.random()})"
        $("#page-section-2 .right-column .animated-image").css "background-image" , "url(/assets/animacion2.gif?#{Math.random()})"
        appliedGif1 = true

$(document).ready(ready)
$(document).on('page:load', ready)