class CreateVoicers < ActiveRecord::Migration
  def change
    create_table :voicers do |t|

      t.timestamps
    end
  end
end
