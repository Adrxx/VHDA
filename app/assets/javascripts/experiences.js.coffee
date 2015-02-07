# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = () ->

  imageCount = 0
  #console.log "READDDJDAKSJDLKASJDLKASJLDKJASLDKJASLKDJLAKSJDLKASJLD"
  changeUrlImage = (input) ->
    #console.log $(input).parent().parent("img")
    reader = new FileReader()
    reader.onload = (e) ->
      $(input).parent().parent().find("img").attr('src', e.target.result)
    reader.readAsDataURL(input.files[0])

  addImage = (input) ->
    #console.log "HEY"
    if (input.file && input.file[0])
      reader = new FileReader()
      reader.onload = (e) ->
        $("#img-tag-#{imageCount}").attr('src', e.target.result)
        $("#experience_photos_attributes_#{imageCount}_file").on "change", (event) ->
          changeUrlImage(this)
        imageCount++
      reader.readAsDataURL(input.files[0])

  addImageInput = () ->
    #console.log "PORQUI"
    if imageCount > 0 
      $('#experience-form-photos').prepend("<div class='photo-as-list'><img id='img-tag-#{imageCount}' src=''><div class='photo-options'><input accept='image/png,image/gif,image/jpeg' id='experience_photos_attributes_#{imageCount}_file' class='file-field' name='experience[photos_attributes][#{imageCount}][file]' type='file'></div></div>")
    else
      $(".photo-as-list").show()
    $("#experience_photos_attributes_#{imageCount}_file").one "change", (event) ->
      addImage(this)
    $("#experience_photos_attributes_#{imageCount}_file").click()


  $("#photo-adder").on "click", (event) ->
    addImageInput()

$(document).ready(ready)
$(document).on('page:load', ready)