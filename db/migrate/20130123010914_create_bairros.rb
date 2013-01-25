class CreateBairros < ActiveRecord::Migration
  def change
    create_table :bairros do |t|
      t.string :titulo
      t.references :estado

      t.timestamps
    end
    add_index :bairros, :estado_id
  end
end
