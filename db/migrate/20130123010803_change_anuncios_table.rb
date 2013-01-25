class ChangeAnunciosTable < ActiveRecord::Migration
  def self.up
    change_table :anuncios do |t|
      t.remove :bairro
      t.remove :estado
    end
  end

  def self.down
    change_table :anuncios do |t|
    end
  end
end