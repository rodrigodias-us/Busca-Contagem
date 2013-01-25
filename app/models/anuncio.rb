class Anuncio < ActiveRecord::Base
  attr_accessible :titulo
  
  belongs_to :categoria
  has_many :telefones
  belongs_to :bairro
end
