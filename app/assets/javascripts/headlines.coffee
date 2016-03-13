# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).ready ->
$(document).on "page:change", ->

  $('#feed-items').on "click", (event) ->
    event_target = $(event.target)

    event_target_parent = $(event.target).parent()
    parent_id = $(event_target_parent).attr("id")
#    alert(parent_id)

#    headline_id = this.id.replace('save', 'link')
    headline_id = parent_id.replace('save', 'link')

    headline_link = $("#" + headline_id + " a")
    headline_title = $(headline_link).html()

    headline_publication_date = $(event_target_parent).attr("data-publication-date")
    headline_url = $(event_target_parent).attr("data-url")

    $('#notice').html('')

    $.ajax '/headlines/save',
      type: 'POST'
      dataType: 'json'

      data: {
        title:            headline_title,
        url:              headline_url,
        publication_date: headline_publication_date
#        url:              $(this).attr("data-url"),
#        publication_date: $(this).attr("data-publication-date")
      }

#      $('#' + uMessage).fadeIn("fast", function() { $(this).delay(1000).fadeOut("slow"); });

      error: (jqXHR, textStatus, errorThrown) ->
        $('#notice').append("Error in saving '#{headline_title}'").show()
#          fadeIn("fast").delay(3000).fadeOut("4000")

      success: (data, textStatus, jqXHR) ->
        $('#notice').append("Successfully saved '#{headline_title}'").show()
#          fadeIn("fast").delay(3000).fadeOut("4000")
