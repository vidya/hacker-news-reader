# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->

  # auto refresh the page about twice an hour
  (() ->
    one_minute      = 60 * 1000
    thirty_minutes  = 30 * one_minute

    setInterval ->
      location.reload()
      sleep(one_minute)
    , (thirty_minutes)
  )()

  # highlight headlines on mouse hover
  $('tr.headline-row').hover (->
    $(this).css 'background', 'burlywood'
  ), ->
    $(this).css 'background', ''

  # handle bubbled up 'save' link clicks at the table level
  $('#feed-items').on "click", (event) ->
    # do nothing if the headline was previously saved
    return if ($(event.target).html() == "saved")

    # locate the td element containing the 'save' link
    # and fetch the headline properties that were attached
    # as data attributes to the td element
    event_target_parent = $(event.target).parent()
    parent_id = $(event_target_parent).attr("id")

    headline_id = parent_id.replace('save', 'link')
    headline_link = $("#" + headline_id + " a")
    headline_title = $(headline_link).html()

    headline_publication_date = $(event_target_parent).attr("data-publication-date-time")
    headline_url = $(event_target_parent).attr("data-url")

    # remove pre-existing notice
    $('#notice').html('')

    $.ajax '/headlines/save',
      type: 'POST'
      dataType: 'json'

      data: {
        title:            headline_title,
        url:              headline_url,
        publication_date: Date(headline_publication_date)
      }

      error: (jqXHR, textStatus, errorThrown) ->
        $('#notice').append("Error in saving '#{headline_title}'")
#          fadeIn("fast").delay(3000).fadeOut("4000")

      success: (data, textStatus, jqXHR) ->
        $('#notice').append("Successfully saved '#{headline_title}'")
#          fadeIn("fast").delay(3000).fadeOut("4000")
