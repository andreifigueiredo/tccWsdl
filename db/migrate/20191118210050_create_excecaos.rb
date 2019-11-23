class CreateExcecaos < ActiveRecord::Migration[5.2]
  def change
    create_table :excecaos do |t|
      t.text :error
      t.references :acao, foreign_key: true

      t.timestamps
    end
  end
end
