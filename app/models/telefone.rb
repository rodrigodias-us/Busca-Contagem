class Telefone < ActiveRecord::Base
  belongs_to :anuncio
  attr_accessible :telefone
end
