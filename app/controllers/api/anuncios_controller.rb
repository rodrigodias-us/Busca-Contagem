class Api::AnunciosController < Api::ApiController
  
  def busca    
    render :json => Anuncio.busca(params['s'],params['p'])
  end
  
  def wavbusca    
    
    gJson = Voicer.googleRead(params[:data])
    
    render :json => json
    
  end
  
end
