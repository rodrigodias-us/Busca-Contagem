class ChangeTablesRelations < ActiveRecord::Migration
  def self.up
    change_table :anuncios do |t|
      t.integer :categoria_id
    end
    change_table :categoria do |t|
      t.remove :anuncio_id
    end
    rename_table :categoria, :categorias
  end

  def self.down
    rename_table :categorias, :categoria
    
    change_table :categoria do |t|
      t.integer :anuncio_id
    end
    change_table :anuncios do |t|
      t.remove :categoria_id
    end
  end
end