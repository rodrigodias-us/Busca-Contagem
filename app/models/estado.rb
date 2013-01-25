class Estado < ActiveRecord::Base
  attr_accessible :titulo
  
  has_many :bairros
end
