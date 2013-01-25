class CreateTelefones < ActiveRecord::Migration
  def change
    create_table :telefones do |t|
      t.string :telefone
      t.references :anuncio

      t.timestamps
    end
    add_index :telefones, :anuncio_id
  end
end
