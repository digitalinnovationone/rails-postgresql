class CreateFornecedoresEnderecos < ActiveRecord::Migration[7.1]
  def change
    create_table :fornecedores_enderecos do |t|
      t.references :endereco, null: false, foreign_key: true
      t.references :fornecedor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
