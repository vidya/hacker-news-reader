# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

#  $('.save-link').click ->
#    alert('HERE')
#    xy = this.id.replace('save', 'link')

#    xy_link = $("#" + xy + " a")
#
##    alert('save-link clicked, xy: ' + $(xy_link).html())
#
#    $.ajax '/favorite/save',
#      type: 'POST'
#      dataType: 'json'
#
#      data: {
#        title:            $(xy_link).html(),
#        url:              $(this).attr("data-url"),
#        publication_date: $(this).attr("data-publication-date")
#      }
#
#      error: (jqXHR, textStatus, errorThrown) ->
#          $('body').append "AJAX Error: #{textStatus}"
#      success: (data, textStatus, jqXHR) ->
#          $('body').append "Successful AJAX call: #{data}"
