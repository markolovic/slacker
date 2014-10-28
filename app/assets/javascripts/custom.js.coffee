change_text = (link_text)->
  if $('.cross').is(':visible') 
    $('#delete').text("Back")
  else 
    $('#delete').text(link_text)

$ ->
  $('#delete').on "click", ->
    event.preventDefault();

    $('.cross').toggleClass('visible')
    change_text("Delete a course")
#`$( document ).ready(function() {
    #$('h1').text("sdft")
#});`
