# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
  imageCount = 0

  addImageInput = () ->
    #console.log "PORQUI"
    $('#experience-form-photos').append '<input accept="image/png,image/gif,image/jpeg" id="experience_photos_attributes_'+ "#{imageCount}" +'_file" name="experience[photos_attributes]['+ "#{imageCount}" +'][file]" type="file">' if imageCount > 0
    $("#experience_photos_attributes_#{imageCount}_file").on "change", (event) ->
      addImage(this)
    $("#experience_photos_attributes_#{imageCount}_file").click()

  addImage = (input) ->
    #console.log "HEY"
    reader = new FileReader()
    $("#experience-form-photos").prepend '<img alt="" class="photo-as-list" id="img-tag-'+ "#{imageCount}"+'" src="">'
    reader.onload = (e) ->
      $('#img-tag-' + "#{imageCount}").attr('src', e.target.result)
      imageCount++
    reader.readAsDataURL(input.files[0])

  $("#photo-adder").on "click", (event) ->
    addImageInput()