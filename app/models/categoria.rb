class Categoria < ActiveRecord::Base
  has_many :anuncios
  attr_accessible :titulo
end
