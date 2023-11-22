class CreateEnderecoses < ActiveRecord::Migration[7.1]
  def change
    create_table :enderecoses do |t|
      t.string :logradouro, limit: 255
      t.string :numero, limit: 50
      t.string :cep, limit: 11
      t.string :cidade, limit: 150
      t.string :estado, limit: 2
      t.string :complemento, limit: 255

      t.timestamps
    end
  end
end
