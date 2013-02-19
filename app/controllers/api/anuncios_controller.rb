class Api::AnunciosController < Api::ApiController
  
  def busca    
    render :json => Anuncio.busca(params['s'],params['p'])
  end
  
  def wavbusca
    gJson = Voicer.googleRead(params[:data])
    
    if gJson["confidence"].to_f > 0.5
      render :json => Anuncio.busca(gJson["utterance"])
    else
      render :json => {error: "Resultado abaixo de 0.5"}
    end
  end
  
end
