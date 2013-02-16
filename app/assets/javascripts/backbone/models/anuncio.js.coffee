class Site.Models.Anuncio extends Backbone.Model
  # defaults:

class Site.Collections.BuscaCollection extends Backbone.Collection
	model: Site.Models.Anuncio
	
	last_page: false
	
	initialize: ->
		$(window).bind 'scroll', window.scrolled
		window.result_view.$el.html ""
	
	# Coloando os dados apartir do "data"
	parse: (response) ->
		if response.total_pages <= page
			@last_page = true
		response.data
		
	load: ->
		if @last_page == false
			@.fetch().success ->
				_.each window.busca.models, (model) ->
					window.result_view.anuncioAdd model
		else
			$(window).unbind 'scroll', window.scrolled
			
window.scrolled = (e) ->
	if ($(window).innerHeight() + $(window).scrollTop()) >= $("body").height() && $.ajax().state() == "pending"
		window.router.navigate "pesquisa/" + window.query + '/page/' + (window.page+1), {trigger: true}