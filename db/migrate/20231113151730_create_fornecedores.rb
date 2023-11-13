class CreateFornecedores < ActiveRecord::Migration[7.1]
  def change
    create_table :fornecedores do |t|
      t.string :nome, limit: 150
      t.string :cnpj, limit: 25
      t.text :endereco

      t.timestamps
    end
  end
end
