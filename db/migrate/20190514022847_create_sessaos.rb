class CreateSessaos < ActiveRecord::Migration[5.2]
  def change
    create_table :sessaos do |t|
      t.references :requisicao, foreign_key: true

      t.timestamps
    end
  end
end
