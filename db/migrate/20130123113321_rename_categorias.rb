class RenameCategorias < ActiveRecord::Migration
  def self.up
    rename_table :categorias, :categoria
  end

  def self.down
    rename_table :categoria, :categorias
  end
end