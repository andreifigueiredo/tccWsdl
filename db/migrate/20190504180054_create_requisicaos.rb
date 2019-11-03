class CreateRequisicaos < ActiveRecord::Migration[5.2]
  def change
    create_table :requisicaos do |t|
      t.string :agent
      t.string :encode
      t.references :acao, foreign_key: true

      t.timestamps
    end
  end
end
