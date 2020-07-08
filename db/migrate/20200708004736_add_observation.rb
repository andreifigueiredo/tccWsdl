class AddObservation < ActiveRecord::Migration[5.2]
  def change
    add_column :dono_excecaos, :observation, :text
  end
end
