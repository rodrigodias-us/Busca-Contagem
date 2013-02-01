class	Site.Views.ResultSearch extends Backbone.View
	el: $('#result-search')
	
	anuncioAdd: (anuncio) ->
		anuncioView = new Site.Views.AnuncioFree {model: anuncio}
		@.$el.append(anuncioView.render().el)