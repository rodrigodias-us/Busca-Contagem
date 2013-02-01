class Anuncio < ActiveRecord::Base
  attr_accessible :titulo
  
  default_scope order('titulo ASC')
  
  belongs_to :categoria
  has_many :telefones
  belongs_to :bairro
end
