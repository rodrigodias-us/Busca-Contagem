class Site.Routers.SearchesRouter extends Backbone.Router

	initialize: ->
		window.result_view = new Site.Views.ResultSearch

	routes:
		'' : 'index'
		'pesquisa/:query' : 'pesquisa'
		'pesquisa/:query/page/:page' : 'paged'
		
	index: ->
		console.log "teste"
  
	pesquisa: (query) ->
		console.log "Buscando por: " + query
		window.busca = new Site.Collections.BuscaCollection
		window.query = query
		window.page = 1
		window.busca.url = "/api/anuncios/busca/" + query + "/"
		window.busca.load()
				
	paged: (query,page) ->
		console.log "Buscando Pagina " + page + " de : " + query
		window.busca ?= new Site.Collections.BuscaCollection
		window.query = query
		window.page = parseInt page
		window.busca.url = "/api/anuncios/busca/" + query + "/page=" + page + "/"
		window.busca.load()