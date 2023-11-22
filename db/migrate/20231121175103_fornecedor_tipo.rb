class FornecedorTipo < ActiveRecord::Migration[7.1]
  def change
    add_reference :fornecedores, :fornecedor_tipo, foreign_key: true
  end
end
