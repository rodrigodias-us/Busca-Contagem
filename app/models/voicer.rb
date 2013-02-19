class Voicer 
  
  # Nome temporario dos arquivos de voz
  @@nameTemp = "tempRec"
  # Diretorio Temporario
  @@directory = "tmp/voicer"
  
  def self.convert(data)
    require 'tempfile'
        
    # Cria os arquivos temporarios
    wpath = File.join(@@directory, "#{@@nameTemp}.wav")
    fpath = File.join(@@directory, "#{@@nameTemp}.flac")
    
    # Escreve o wav
    File.open(wpath, "wb") { |f| f.write(data.read) }
    
    # Converte usando o sistema
    system("sox #{wpath} #{fpath}")
    
    # Le a conversão
    File.open(fpath).read
  end
  
  def self.googleRead(data)
    require "net/http"
    
    # Converte usando o Sox
    flac = self.convert(data)
    
    # URI do google
    uri = URI.parse("http://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&pfilter=2&lang=pt_BR&maxresults=6")
    
    # Cria a requisição no google
    req = Net::HTTP::Post.new "#{uri.path}?#{uri.query}"
    req.body = '------WebKitFormBoundaryq2vA3BmMPYvC6gDN
Content-Disposition: form-data; name="file"; filename="tempRec.flac"
Content-Type: application/octet-stream
' +flac+ '
------WebKitFormBoundaryq2vA3BmMPYvC6gDN--
'
    req["Content-Type"] = "audio/x-flac; rate=16000"
    
    # Faz a requisição ao google
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.start {|htt| htt.request(req)}
    
    # Retorna o 1 resultado em json
    json = JSON.parse(response.body)
    json["hypotheses"][0]
  end
  
end
