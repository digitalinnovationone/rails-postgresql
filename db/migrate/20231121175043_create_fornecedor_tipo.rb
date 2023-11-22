class CreateFornecedorTipo < ActiveRecord::Migration[7.1]
  def change
    create_table :fornecedor_tipo do |t|
      t.string :nome, limit: 100

      t.timestamps
    end
  end
end
