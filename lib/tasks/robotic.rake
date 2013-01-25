task :apontador => :environment do
  require "open-uri"
  
  regEXBloc = %r[<div class="result hreview-aggregate(.+?<span class="tel">.+?<\/span>)]m
  
  regEXSingle = %r[.html">(.+?)<\/a>.+<p class="category mb10">(.+?)<\/p>.+?street-address">(.+?)?,(.+?)<\/span>.+locality">(.+?)-(.+?)<\/span>.+tel">(.+?)<\/span>]m
  
  for i in 13758..18422
      
    html = open("http://www.apontador.com.br/em/mg_contagem?page="+i.to_s).read
    getAnunciosBloc = html.scan(regEXBloc)
    
    getAnunciosBloc.each do |getAnuncioSingle|
      getAnuncio = getAnuncioSingle[0].scan(regEXSingle)[0]

      puts "Page "+i.to_s+" :::::: Make => "+getAnuncio[0].force_encoding("UTF-8").strip+" ::::: Encontrados ::::: "+getAnunciosBloc.count.to_s
      
      @anuncio = Anuncio.where({titulo: getAnuncio[0].force_encoding("UTF-8").strip}).first_or_create
      
      @categoria = Categoria.where({titulo: getAnuncio[1].force_encoding("UTF-8").strip}).first_or_create
      @categoria.titulo = getAnuncio[1].force_encoding("UTF-8").strip
      
      @estado = Estado.where({titulo: getAnuncio[5].force_encoding("UTF-8").strip}).first_or_create
      @estado.titulo = getAnuncio[5].force_encoding("UTF-8").strip
      
      @bairro = Bairro.where({titulo: getAnuncio[4].force_encoding("UTF-8").strip}).first_or_create
      @bairro.titulo = getAnuncio[4].force_encoding("UTF-8").strip
      @bairro.estado = @estado
      
      @telefone = Telefone.where({telefone: getAnuncio[6].force_encoding("UTF-8").strip}).first_or_create
      @anuncio.telefones << @telefone
      
      @anuncio.categoria = @categoria
      
      @anuncio.titulo = getAnuncio[0].force_encoding("UTF-8").strip
      @anuncio.rua = getAnuncio[2].force_encoding("UTF-8").strip
      @anuncio.numero = getAnuncio[3].force_encoding("UTF-8").strip
      @anuncio.bairro = @bairro
      
      @anuncio.save
    end
    
  end
  
end