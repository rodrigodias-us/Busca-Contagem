class AlterTableAnuncio < ActiveRecord::Migration
  def self.up
    change_table :anuncios do |t|
      t.string :rua
      t.string :numero
      t.string :bairro
      t.string :estado
    end
  end

  def self.down
    change_table :anuncios do |t|
    end
  end
end