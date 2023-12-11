class CreateFornecedorTipo < ActiveRecord::Migration[7.1]
  def change
    create_table :fornecedor_tipos do |t|
      t.string :nome, limit: 100

      t.timestamps
    end
  end
end
