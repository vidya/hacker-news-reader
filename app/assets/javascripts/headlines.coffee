# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->

  $('.table-striped .headline-row').hover (->
    $(this).css 'background', 'burlywood'
  ), ->
    $(this).css 'background', ''

  $('#feed-items').on "click", (event) ->

    return if ($(event.target).html() == "SAVED")

    event_target_parent = $(event.target).parent()
    parent_id = $(event_target_parent).attr("id")

    headline_id = parent_id.replace('save', 'link')
    headline_link = $("#" + headline_id + " a")
    headline_title = $(headline_link).html()

    headline_publication_date = $(event_target_parent).attr("data-publication-date-time")
    headline_url = $(event_target_parent).attr("data-url")

    xy = Date(headline_publication_date)

    $('#notice').html('')

    $.ajax '/headlines/save',
      type: 'POST'
      dataType: 'json'

      data: {
        title:            headline_title,
        url:              headline_url,
#        publication_date: $(event_target_parent).attr("data-publication-date-time")
        publication_date: xy
      }

      error: (jqXHR, textStatus, errorThrown) ->
        $('#notice').append("Error in saving '#{headline_title}'")
#          fadeIn("fast").delay(3000).fadeOut("4000")

      success: (data, textStatus, jqXHR) ->
        $('#notice').append("Successfully saved '#{headline_title}'")
#          fadeIn("fast").delay(3000).fadeOut("4000")
#        $(headline_link).html('SAVED')
#        $(event_target_parent).html('SAVED')
