# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  success =  (event, data, xhr) ->
    tr = $(this).closest 'tr'
    tr.replaceWith(data)

  $('body').on('ajax:success', '.story .btn', success)

