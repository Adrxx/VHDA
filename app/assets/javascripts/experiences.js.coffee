# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = () ->
  $(".experience-as-list").on "click", ->
    if ($(this).attr('data-main-exp-link'))
      window.location = $(this).data("main-exp-link")
      #console.log "POR AQUI SUNSHINE"
      #$(this).find("[data-main-exp-link]").

  $(".file-field").on "change", ->
    #console.log "HELLOOOO"
    changeUrlImage(this)

  $(".remove-existent").on "click", ->
    #console.log "PORQUI"
    $(this).find("input").attr "value", "true"
    $(this).parent().hide()

  imageCount = $('.photo-as-list').size() 
  #console.log (imageCount) + "READDDJDAKSJDLKASJDLKASJLDKJASLDKJASLKDJLAKSJDLKASJLD"
  changeUrlImage = (input) ->
    #console.log $(input).parent().parent("img")
    reader = new FileReader()
    reader.onload = (e) ->
      $(input).parent().parent().find("img").attr('src', e.target.result)
    reader.readAsDataURL(input.files[0])

  addImage = (input) ->
    #console.log "HEY"
    if (input.files && input.files[0])
      reader = new FileReader()
      reader.onload = (e) ->
        $("#img-tag-#{imageCount}").attr('src', e.target.result)
        $("#experience_photos_attributes_#{imageCount}_file").on "change", (event) -> 
          changeUrlImage(this)
        imageCount++
      reader.readAsDataURL(input.files[0])

  addImageInput = () ->
    #console.log "PORQUI"
    $('#experience-form-photos').prepend("<div class='photo-as-list'><img id='img-tag-#{imageCount}' src=''><div class='remove'></div><div class='photo-options'><input accept='image/png,image/gif,image/jpeg' id='experience_photos_attributes_#{imageCount}_file' class='file-field' name='experience[photos_attributes][#{imageCount}][file]' type='file'></div></div>")
    $("#img-tag-#{imageCount}+.remove").on "click", (event) ->
      $(this).parent().remove()

    $("#experience_photos_attributes_#{imageCount}_file").one "change", (event) ->
      addImage(this)
    $("#experience_photos_attributes_#{imageCount}_file").click()

  $("#photo-adder").on "click", (event) ->
    addImageInput()

$(document).ready(ready)
$(document).on('page:load', ready)