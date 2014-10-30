# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
 $('#add_journal').click (event) ->
    event.preventDefault()
    journal_name = prompt("Add a journal title")
    if journal_name is ""
      false      
    else
      url = "/projects/add_journal"
      name = { name: journal_name }
      $.post(url, name).then ->
        console.log("success")

jQuery ->
 $('#remove_journal').click (event) ->
    event.preventDefault()
    
    answer = confirm("Do you want to delete this?")
    if answer      
      url = "/projects/remove_journal" 
      params = { id: $('option:selected').val(), _method: "delete" }
      $.post(url, params).then ->
        $('option:selected', 'select').remove()
        console.log("deleted")
    else
      false    