class Anuncio < ActiveRecord::Base
  attr_accessible :titulo
  
  default_scope order('titulo ASC')
  
  belongs_to :categoria
  has_many :telefones
  belongs_to :bairro
  
  def self.sql(s)
    sql = ""
    s.split(' ').each do |w|
      sql << "titulo LIKE '%#{w}%' AND "
    end
    sql << "1 = 1"
  end
  
  def self.busca(s,p=1)    
    sql = self.sql(s)
    data = self.where(sql).page(p).per(10)
    {
      query: s,
      total: self.where(sql).count,
      total_pages: (self.where(sql).count/10).ceil,
      page: p,
      data: data.as_json(:include => [:telefones, :bairro])
    }
  end
  
  def self.buscaMobile(s)
    sql = self.sql(s)
    data = self.where(sql)
    {
      query: s,
      total: self.where(sql).count,
      data: data.as_json(:include => [:telefones, :bairro])
    }
  end
  
end
