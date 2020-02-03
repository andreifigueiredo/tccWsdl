class CreateParametros < ActiveRecord::Migration[5.2]
  def change
    create_table :parametros do |t|
      t.string :param_tipo
      t.string :param_nome
      t.references :excecao, foreign_key: true

      t.timestamps
    end
  end
end
