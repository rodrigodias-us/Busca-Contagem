class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :titulo

      t.timestamps
    end
  end
end
