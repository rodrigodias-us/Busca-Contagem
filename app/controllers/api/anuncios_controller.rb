class Api::AnunciosController < Api::ApiController
  
  def busca
    s = params['s']
    p = params['p']
    p ||= 1
    
    sql = ""
    
    s.split(' ').each do |w|
      sql << "titulo LIKE '%#{w}%' AND "
    end
    sql << "1 = 1"
    data = Anuncio.where(sql).page(p).per(10)
    
    render :json => {
      total: Anuncio.where(sql).count,
      total_pages: (Anuncio.where(sql).count/10).ceil,
      page: p,
      data: data.as_json(:include => [:telefones, :bairro])
    }
  end
  
  def wavbusca
    upload = params[:upload]
    name =  upload['datafile'].original_filename
    directory = "public/temp"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
  
end
