class AddEvaluate < ActiveRecord::Migration[5.2]
  def change
    add_column :dono_excecaos, :evaluate, :integer
  end
end
