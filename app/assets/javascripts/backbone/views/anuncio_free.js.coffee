class	Site.Views.AnuncioFree extends Backbone.View
	template: JST['backbone/templates/anunciofree']
	
	render: ->
		$(@el).hide()
		$(@el).html(@template(anuncio: @model))
		$(@el).fadeIn(200)
		@