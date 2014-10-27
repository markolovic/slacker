change_text = ->
  if $('.cross').is(':visible') 
    $('#delete').text("Back")
  else 
    $('#delete').text("Delete a class")

$ ->
  $('#delete').on "click", ->
    event.preventDefault();

    $('.cross').toggleClass('visible')
    change_text()
#`$( document ).ready(function() {
    #$('h1').text("sdft")
#});`
