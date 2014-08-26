# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.setTimeout ->
  $('.alert').fadeTo(500, 0).slideUp 500, ->
    $(this).remove()
, 5000

$ ->
	$(document.body).on 'click', '.track-link', (e) ->
		url = @href
		console.log ('dsds')
		link_id = $(this).data('link-id')
		$.get "track_link?link_id=#{link_id}", (data) ->

		true
