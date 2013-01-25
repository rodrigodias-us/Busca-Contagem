class AddAnuncioBairroId < ActiveRecord::Migration
  def self.up
    change_table :anuncios do |t|
      t.integer :bairro_id
    end
  end

  def self.down
    change_table :anuncios do |t|
      t.remove :bairro_id
    end
  end
end