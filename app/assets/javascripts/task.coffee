# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$(".todo-item label").dblclick ->
		$(this).parent().parent().addClass('editing')

	$("li.editing .edit").blur ->
		console.log('bla')
		$(this).parent().removeClass('editing')
