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
    require "net/http"
    
    upload = params[:data]
    
    name =  "tempRec.wav"
    nameFlac = "tempRec.flac"
    
    directory = "public/temp"
    
    # create the file path
    path = File.join(directory, name)
    flacPath = File.join(directory, nameFlac)
    
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
    
    # convert
    system("sox #{path} #{flacPath}")
    
    flac = File.open(flacPath).read
    
    uri = URI.parse("http://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&pfilter=2&lang=pt_BR&maxresults=6")
    
    req = Net::HTTP::Post.new "#{uri.path}?#{uri.query}"
      
      req.body = '------WebKitFormBoundaryq2vA3BmMPYvC6gDN

Content-Disposition: form-data; name="file"; filename="tempRec.flac"

Content-Type: application/octet-stream

' +flac+ '
------WebKitFormBoundaryq2vA3BmMPYvC6gDN--
'
    
    req["Content-Type"] = "audio/x-flac; rate=16000"
    
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.start {|htt| htt.request(req)}
    
    json = JSON.parse(response.body)
    
    logger.debug json
    
    sql = ""
    
    json.hypotheses[0].utterance.split(' ').each do |w|
      sql << "titulo LIKE '%#{w}%' AND "
    end
    
    sql << "1 = 1"
    data = Anuncio.where(sql)
    
    render :json => data.as_json(:include => [:telefones, :bairro])
    
  end
  
end
