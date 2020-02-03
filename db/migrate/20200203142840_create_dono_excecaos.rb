class CreateDonoExcecaos < ActiveRecord::Migration[5.2]
  def change
    create_table :dono_excecaos do |t|
      t.boolean :solved
      t.references :developer
      t.references :excecao

      t.timestamps
    end
  end
end
