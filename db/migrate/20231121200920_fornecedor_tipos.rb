class FornecedorTipos < ActiveRecord::Migration[7.1]
  def change
    rename_table :fornecedor_tipo, :fornecedor_tipos
  end
end
