class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :titulo
      t.references :anuncio

      t.timestamps
    end
    add_index :categoria, :anuncio_id
  end
end
