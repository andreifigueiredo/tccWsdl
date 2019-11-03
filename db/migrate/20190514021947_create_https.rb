class CreateHttps < ActiveRecord::Migration[5.2]
  def change
    create_table :https do |t|
      t.text :view_referer
      t.text :view_url
      t.text :view_method
      t.references :requisicao, foreign_key: true

      t.timestamps
    end
  end
end
