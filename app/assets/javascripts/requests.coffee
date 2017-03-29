# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', ->
  form = document.querySelector('.simple_form')
  issue = document.querySelector('.request_issue')
  form.addEventListener 'change', ((e) ->
    if form['request[bg_type]'].value == '0'
      issue.classList.add 'is-visible'
    else
      issue.classList.remove 'is-visible'
    return
  ), false
  $('.form-group.string.optional.request_date_end input').datepicker language: 'ru'
  return
