class CreateAcaos < ActiveRecord::Migration[5.2]
  def change
    create_table :acaos do |t|
      t.string :nome
      t.string :classe

      t.timestamps
    end
  end
end
