class Site.Models.Anuncio extends Backbone.Model
  # defaults:

class Site.Collections.BuscaCollection extends Backbone.Collection
	model: Site.Models.Anuncio
	
	initialize: ->
		window.result_view.$el.html ""
	
	# Coloando os dados apartir do "data"
	parse: (response) ->
		response.data