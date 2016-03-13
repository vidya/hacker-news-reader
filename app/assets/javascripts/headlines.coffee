# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).ready ->
$(document).on "page:change", ->
  $('.save-link').click ->
    headline_id = this.id.replace('save', 'link')

    headline_link = $("#" + headline_id + " a")
    headline_title = $(headline_link).html()

    $('#notice').html('')

    $.ajax '/headlines/save',
      type: 'POST'
      dataType: 'json'

      data: {
        title:            headline_title,
        url:              $(this).attr("data-url"),
        publication_date: $(this).attr("data-publication-date")
      }

      error: (jqXHR, textStatus, errorThrown) ->
        $('#notice').append "Error in saving '#{headline_title}'"

      success: (data, textStatus, jqXHR) ->
        $('#notice').append "Successfully saved '#{headline_title}'"
