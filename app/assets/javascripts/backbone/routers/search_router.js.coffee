class Site.Routers.SearchesRouter extends Backbone.Router

	initTime: true

	initialize: ->
		window.result_view = new Site.Views.ResultSearch

	routes:
		'' : 'index'
		'pesquisa/:query' : 'pesquisa'
		'pesquisa/:query/page/:page' : 'paged'
		
	index: ->
		@.initTime = false
		console.log "teste"
  
	pesquisa: (query) ->
		
		if @.initTime == true
			$('#search-input').val(query)
			$('.search-bar').animate {
				"top" : 25,
				"margin-top" : 0
			}, "fast"
			$('.search-bar .footer').fadeOut "fast"
			$('footer').fadeIn "fast", (e) ->
				$('.search-bar').height 153
				$('.content').fadeIn "fast"
			@.initTime == false
				
		console.log "Buscando por: " + query
		window.busca = new Site.Collections.BuscaCollection
		window.query = query
		window.page = 1
		window.busca.url = "/api/anuncios/busca/" + query + "/"
		window.busca.load()
				
	paged: (query,page) ->
		
		if @.initTime == true
			$('#search-input').val(query)
			$('.search-bar').animate {
				"top" : 25,
				"margin-top" : 0
			}, "fast"
			$('.search-bar .footer').fadeOut "fast"
			$('footer').fadeIn "fast", (e) ->
				$('.search-bar').height 153
				$('.content').fadeIn "fast"
			@.initTime == false
			
		console.log "Buscando Pagina " + page + " de : " + query
		window.busca ?= new Site.Collections.BuscaCollection
		window.query = query
		window.page = parseInt page
		window.busca.url = "/api/anuncios/busca/" + query + "/page=" + page + "/"
		window.busca.load()