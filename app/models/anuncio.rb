class Anuncio < ActiveRecord::Base
  attr_accessible :titulo
  
  default_scope order('titulo ASC')
  
  belongs_to :categoria
  has_many :telefones
  belongs_to :bairro
  
  
  def self.busca(s,p=1)    
    sql = ""
    s.split(' ').each do |w|
      sql << "titulo LIKE '%#{w}%' AND "
    end
    sql << "1 = 1"
    data = self.where(sql).page(p).per(10)
    
    {
      query: s,
      total: self.where(sql).count,
      total_pages: (self.where(sql).count/10).ceil,
      page: p,
      data: data.as_json(:include => [:telefones, :bairro])
    }
  end
  
end
