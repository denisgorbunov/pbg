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

  dateStart = document.querySelector('.request_date_start')
  dateEnd = document.querySelector('.request_date_end')
  form.addEventListener 'change', ((e) ->
    if form['request[immediately]'].value == 'false'
      dateStart.classList.add 'is-visible'
      dateEnd.classList.add 'is-visible'
    else if form['request[immediately]'].value == 'true'
      dateEnd.classList.add 'is-visible'
      dateStart.classList.remove 'is-visible'
    return
  ), false

  $('.form-group.string.optional.request_date_end input').datepicker language: 'ru'
  $('.form-group.string.optional.request_date_start input').datepicker language: 'ru'
  return
