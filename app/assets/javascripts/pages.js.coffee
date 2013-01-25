# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

pesquisar = (event) ->
	if $('#search-input').val().length > 3
		$('.search-bar').animate {
			"top" : 25,
			"margin-top" : 0
		}
		$('.search-bar .footer').fadeOut "fast"
		$('footer').fadeIn "fast"
	else
		console.log "Sua pesquisa tem que ter mais de 3 letras"
	
home = (event) ->
	$('#search-input').val ""
	$('.search-bar').animate {
		"top" : "50%",
		"margin-top" : -100
	}
	$('.search-bar .footer').fadeIn "fast"
	$('footer').fadeOut "fast"

$('#home').click home
$('#search-button').click pesquisar
$('#search-input').keypress (event) ->
	if(event.keyCode == 13)
		pesquisar event