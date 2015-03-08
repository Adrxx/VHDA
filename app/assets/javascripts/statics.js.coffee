# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
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
active = false
transformableBar = true
outsideLinks = true

animateMenu = (time) ->
  if !active
    upperLineL.animate( {transform: ul}, time)
    upperLineR.animate( {transform: ur}, time)
    middleLine.animate( {transform: m, opacity: 1}, time) 
    lowerLineL.animate( {transform: ll}, time)
    lowerLineR.animate( {transform: lr}, time)
    $('#nav-tabs-container').addClass "expanded-menu"

    active= true
  else
    noMatrix = new Snap.Matrix()
    time = time /2
    upperLineL.animate( { transform: noMatrix} , time)
    upperLineR.animate( { transform: noMatrix} , time)
    middleLine.animate( { transform: noMatrix,opacity: 1} , time) 
    lowerLineL.animate( { transform: noMatrix} , time)
    lowerLineR.animate( { transform: noMatrix} , time)
    $('#nav-tabs-container').removeClass "expanded-menu"

    active= false



generateMenu = ->
  lineWidth = 2
  gapBetween = 11
  width = 28
  height = lineWidth*3 + gapBetween*2
  $('#nav-button').width width
  $('#nav-button').height height
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

@normalSubmit = ->
    $('#mail-form .submit').css "pointer-events", "initial"
    $('#mail-form .submit').prop "value", "Enviar"
  
ready = ->
  $('#mail-form .submit').on "click" , ->
    if document.getElementById("correo").checkValidity()
      $('#mail-form .submit').css "pointer-events", "none"
      $('#mail-form .submit').prop "value", "Enviando..."

  $("[class^='contact-text']").on "keyup", ->
    nombreL = $('#mail-form #nombre').val().length
    correoL = $('#mail-form #correo').val().length
    mensajeL = $('#mail-form #mensaje').val().length
    if nombreL > 0 && correoL > 0 && mensajeL > 0
      $('#mail-form .submit').css "opacity", 1
    else
      $('#mail-form .submit').css "opacity", 0.3

  $("#mail-form").on("ajax:success", (e, data, status, xhr) ->
    showGracias= ->
      console.log "kjashk"
      $('#contact-panel .centered').html "<h3>Gracias</h3><p>Tu mensaje ha sido enviado.</p>"
      $('#contact-panel .centered').css "height", "auto"
      $('#contact-panel').fadeIn()
    $('#contact-panel').fadeOut("slow",showGracias) if xhr.responseText == "aceptado"
  ).on "ajax:error", (e, xhr, status, error) ->
    $('#mail-form .submit').prop "disabled", false
    $('#mail-form .submit').prop "Value", "Enviar"

  appliedGif2 = false
  appliedGif1 = false

  appliedMiniBar = false
  appliedNormalBar = false
  generateMenu()
  $('a[href*=#]:not([href=#])').on "click", (event) ->
    if $(this).data "smooth-scroll"
      event.preventDefault();
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname)
        target = $(this.hash);
        if (target.length)
          $('html,body').animate({ scrollTop: target.offset().top - 60 }, 1000);
          animateMenu(300)

  $('#arrow').on "click", ->
    $('html,body').animate({ scrollTop: $('#page-section-2').offset().top + 20 }, 1000);

    
  $(document).scroll ->
    vertical_scroll = $(document).scrollTop()
    width = $( window ).width()
    parallax = width > 769

    if parallax 
      $("#page-section-1 .page-image-background").css "background-position", "center #{vertical_scroll/2}px"
      $("#page-section-3 .page-image-background").css "background-position", "center #{vertical_scroll/2}px"


    navTransformRange = 100;
    navTransformRange = 400 if !parallax;
    if transformableBar
      if vertical_scroll > navTransformRange
        if !appliedMiniBar
          $("#nav-bar").attr "id" ,"mini-nav-bar"
          $('#nav-bar-mobile').css "background-color","#171b23"
          $('.current-tab').css "color","white"
          #$("#nav-tabs-container").addClass "scrolled"
          appliedMiniBar = true
        appliedNormalBar = false
      else
        if !appliedNormalBar
          $("#mini-nav-bar").attr "id" ,"nav-bar"
          $('#nav-bar-mobile').css "background-color","transparent"
          $('.current-tab').css "color","transparent"

          #$("#nav-tabs-container").removeClass "scrolled"
          appliedNormalBar = true
        appliedMiniBar = false

    inRange= (x,div) ->
      threshold = 200
      x >= $("#{div}").offset().top-threshold && x <= ($("#{div}").offset().top+$("#{div}").height() - threshold)

    if inRange vertical_scroll, '#page-section-1'
      $("#nav-tabs-container a").removeClass "selected"
      $(".current-tab").html "Servicios"
    else if inRange vertical_scroll, '#page-section-2'
      $("#nav-tabs-container a").removeClass "selected"
      $("#nav-tabs-container a:nth-child(1)").addClass "selected"
      $(".current-tab").html "Servicios"
    else if inRange vertical_scroll, '#page-section-3'
      $("#nav-tabs-container a").removeClass "selected"
      $("#nav-tabs-container a:nth-child(2)").addClass "selected"
      $(".current-tab").html "Nosotros"
    else if inRange vertical_scroll, '#page-section-4'
      $("#nav-tabs-container a").removeClass "selected"
      $("#nav-tabs-container a:nth-child(3)").addClass "selected"    
      $(".current-tab").html "Experiencia"
    else if inRange vertical_scroll, '#page-section-5'
      $("#nav-tabs-container a").removeClass "selected"
      $("#nav-tabs-container a:nth-child(4)").addClass "selected"
      $(".current-tab").html "Contacto"


    if vertical_scroll > $("#page-section-2 .left-column").offset().top - $("#page-section-2 .left-column").height()/2
      if !appliedGif1
        $("#page-section-2 .left-column .animated-image").css "background-image" , "url(/assets/animacion1.gif?#{Math.random()})"
        appliedGif1 = true
    if vertical_scroll > $("#page-section-2 .right-column").offset().top - $("#page-section-2 .left-column").height()/2
      if !appliedGif2
        $("#page-section-2 .right-column .animated-image").css "background-image" , "url(/assets/animacion2.gif?#{Math.random()})"
        appliedGif2 = true


$(document).ready(ready)
$(document).on('page:load', ready)