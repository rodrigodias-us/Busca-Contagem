# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


# Inicio das Ações

pesquisar = (e) ->
	window.query = $('#search-input').val()
	if query.length > 3
		window.router.navigate "pesquisa/" + query, {trigger: true}
		$('.search-bar').animate {
			"top" : 25,
			"margin-top" : 0
		}, "fast"
		$('.search-bar .footer').fadeOut "fast"
		$('footer').fadeIn "fast", (e) ->
			$('.search-bar').height 153
			$('.content').fadeIn "fast"
	else
		console.log "Sua pesquisa tem que ter mais de 3 letras"
	
home = (e) ->
	$('#search-input').val ""
	$('.content').fadeOut "fast", (e) ->
		$('.search-bar').animate {
			"top" : "50%",
			"margin-top" : -80
		}
		$('.search-bar .footer').fadeIn "fast"
		$('footer').fadeOut "fast"
		
scrolled = (e) ->
	if ($(window).innerHeight() + $(window).scrollTop()) >= $("body").height() && $.ajax().state() == "pending"
		window.router.navigate "pesquisa/" + window.query + '/page/' + (window.page+1), {trigger: true}

# Fim das Ações

$('#home').click home
$(window).on 'scroll', scrolled
$('#search-button').click pesquisar
$('#search-input').keypress (event) ->
	if(event.keyCode == 13)
		pesquisar event