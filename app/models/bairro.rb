class Bairro < ActiveRecord::Base
  belongs_to :estado
  attr_accessible :titulo
end
